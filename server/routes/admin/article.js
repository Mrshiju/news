const express = require('express');
const fs = require('fs');
const multer = require('multer');
const sharp = require('sharp');
const uuidv1 = require('uuid/v1');
const pathLib = require('path');

let db = require('../../config/mysql');
const jwt = require('express-jwt');
const {
	log
} = require('console');
const router = express.Router();

// 数据库
const upload = multer();
//图片处理
//uuid
router.post("/getArticleList", function (req, res) {
	let {
		pageSize = 4, page
	} = req.body;
	console.log(req.body, 'req.body');
	//拼接SQL
	let size = parseInt(pageSize);
	let count = size * (page - 1);
	let sql =
		`SELECT *  FROM article_list WHERE 1 = 1`

	sql += ` LIMIT ${ count },${ size };SELECT FOUND_ROWS() as total;`


	db.query(sql, [], function (results, fields) {
		//成功
		res.json({
			status: true,
			msg: "success!",
			goods: results[0],
			total: results[1][0].total

		});
	});
});
// 获取文章详情
router.post("/getArticle", function (req, res) {
	let {
		id
	} = req.body;
	//拼接SQL

	let sql =
		`SELECT * FROM article_list WHERE id = ?`
	//判断是否登录用户？


	db.query(sql, [id], function (results, fields) {
		//成功
		res.json({
			status: true,
			msg: "success!",
			goods: results[0],
		});
	});
});
// 获取分类
router.post("/getKindList", function (req, res) {
	let {
		id
	} = req.body;
	//拼接SQL

	let sql =
		`SELECT * FROM article_kind_list WHERE 1 = 1`
	//判断是否登录用户？


	db.query(sql, [], function (results, fields) {
		//成功
		res.json({
			status: true,
			msg: "success!",
			data: results,
		});
	});
});
// 删除文章分类
router.post("/delArticle", function (req, res) {
	let {
		id
	} = req.body;
	//拼接SQL

	let sql =
		`DELETE FROM article_list WHERE id = ?`
	//判断是否登录用户？

	db.query(sql, [id], function (results, fields) {
		//成功
		res.json({
			status: true,
			msg: "success!",
			data: results,
		});
	});
});


/**
 * @api {post} /api/upload/goods 上传商品主图
 * @apiDescription 上传图片会自动检测图片质量，压缩图片，体积<2M，尺寸（300~1500），存储至goods文件夹
 * @apiName uploadGoods
 * @apiGroup admin Upload Image
 * @apiPermission admin
 *
 * @apiParam {File} file File文件对象;
 *
 * @apiSampleRequest /api/upload/goods
 *
 * @apiSuccess {String} lgImg 返回720宽度图片地址.
 * @apiSuccess {String} mdImg 返回360宽度图片地址.
 */
router.post("/common", upload.single('file'), async function (req, res) {
	//上传类型
	let {
		type
	} = req.body;
	//文件类型
	let {
		mimetype,
		size
	} = req.file;
	console.log(req.file, 'req.file');
	//判断是否为图片
	var reg = /^image\/\w+$/;
	// 判断是否未视频
	var reg2 = /^video\/\w+$/;

	var flag = reg.test(mimetype) || reg2.test(mimetype);
	if (!flag) {
		res.status(400).json({
			status: false,
			msg: "格式错误，请选择一张图片!"
		});
		return;
	}
	//判断图片体积是否小于2M
	if (size >= 10 * 1024 * 1024) {
		res.status(400).json({
			status: false,
			msg: "图片体积太大，请压缩图片!"
		});
		return;
	}
	// 获取图片信息
	var {
		width,
		height,
		format
	} = await sharp(req.file.buffer).metadata();
	// 判读图片尺寸
	if (type == "avatar" && width != height) {
		res.status(400).json({
			status: false,
			msg: "图片必须为正方形，请重新上传!"
		});
		return;
	}
	// 生成文件名
	var filename = uuidv1();
	//储存文件夹
	var fileFolder = `/images/goods/`;
	//处理图片
	try {
		await sharp(req.file.buffer).toFile("public" + fileFolder + filename + '.' + format);
		//返回储存结果
		res.json({
			status: true,
			msg: "图片上传处理成功!",
			src: process.env.server + fileFolder + filename + '.' + format
		});
	} catch (error) {
		console.log(error)
		res.json({
			status: false,
			msg: error,
		});
	}
});

// 上传视频
router.post("/video", upload.single('file'), async function (req, res) {
	//上传类型
	let {
		type
	} = req.body;
	//文件类型
	let {
		mimetype,
		size,
		originalname,
		fieldname,
		path,
		buffer
	} = req.file;
	// return;
	// 获取当前目录
	let result = await fs.writeFile('public/images/goods/' + originalname, buffer, 'buffer', (err, res) => {
		if (res) {
			console.log(res)
		}
		if (err) return console.error(err);
	});
	// 获取host
	let host = req.headers.host;
	let img_url = 'http://' + host + '/images/goods/' + originalname;
	console.log(img_url, 'host');
	res.json({
		status: true,
		msg: "视频上传成功!",
		src: img_url

	});
});

// 添加文章
router.post("/addArticle", function (req, res) {
	let {
		title,
		content,
		coverUrl,
		description,
		homeShow
	} = req.body;
	//拼接SQL

	let sql =
		`INSERT INTO article_list (article_title, content ,cover_img,description,home_show) VALUES (?, ?, ?, ?, ?)`
	//判断是否登录用户？

	db.query(sql, [title, content, coverUrl, description, homeShow], function (results, fields) {
		//成功
		res.json({
			status: true,
			msg: "success!",
			data: results,
		});
	});
});

// 更新文章
router.post("/updateArticle", function (req, res) {
	let {
		id,
		title,
		content,
		coverUrl,
		description,
		homeShow
	} = req.body;
	//拼接SQL

	let sql =

		`UPDATE article_list SET article_title = ?, content = ?, cover_img = ?,description = ?,home_show = ? WHERE id = ?`
	//判断是否登录用户？

	db.query(sql, [title, content, coverUrl, description, homeShow, id], function (results, fields) {
		//成功
		res.json({
			status: true,
			msg: "success!",
			data: results,
		});
	});
});
//更新文章点赞
router.post("/updateArticleLike", function (req, res) {
	let {
		id,
		like
	} = req.body;
	//拼接SQL

	let sql =
		`UPDATE article_list SET praises = ? WHERE id = ?`
	//判断是否登录用户？

	db.query(sql, [like, id], function (results, fields) {
		//成功
		res.json({
			status: true,
			msg: "success!",
			data: results,
		});
	});
});
// 获取文章评论数
router.post("/getArticleComment", function (req, res) {
	let {
		id
	} = req.body;
	//拼接SQL

	let sql =

		`SELECT * FROM article_comment WHERE article_id = ?`
	//判断是否登录用户？

	db.query(sql, [id], function (results, fields) {
		//成功
		res.json({
			status: true,
			msg: "success!",
			data: results,
		});
	});
});
// 添加文章评论数
router.post("/addArticleComment", function (req, res) {
	let {
		id,
		commentText,
		user_name,
		avater
	} = req.body;
	//拼接SQL

	let sql =
		`INSERT INTO article_comment (article_id, comment_text,user_name,avater) VALUES (?, ?, ?, ?)`
	//判断是否登录用户？

	db.query(sql, [id, commentText, user_name, avater], function (results, fields) {
		//成功
		res.json({
			status: true,
			msg: "success!",
			data: results,
		});
	});
});

// 获取视频列表
router.post("/getDailyList", function (req, res) {
	let {
		pageSize = 4, page
	} = req.body;
	console.log(req.body, 'req.body');
	//拼接SQL
	let size = parseInt(pageSize);
	let count = size * (page - 1);
	let sql =
		`SELECT *  FROM daily WHERE 1 = 1`

	sql += ` LIMIT ${ count },${ size };SELECT FOUND_ROWS() as total;`

	db.query(sql, [], function (results, fields) {
		//成功
		res.json({
			status: true,
			msg: "success!",
			data: results[0],
			total: results[1][0].total
		});
	});
});
// 添加视频
router.post("/addDaily", function (req, res) {
	let {
		content,
		img_url,
		date,
		from,
		type
	} = req.body;
	//拼接SQL

	let sql =

		`INSERT INTO daily (content ,imgUrl, create_date,type) VALUES (?, ?, ?,?)`
	//判断是否登录用户？

	db.query(sql, [content, img_url, date, type], function (results, fields) {
		//成功
		res.json({
			status: true,
			msg: "success!",
			data: results,
		});
	});
});
// 获取视频详情
router.post("/getDaily", function (req, res) {
	let {
		id
	} = req.body;
	//拼接SQL

	let sql =

		`SELECT * FROM daily WHERE id = ?`
	//判断是否登录用户？

	db.query(sql, [id], function (results, fields) {
		//成功
		res.json({
			status: true,
			msg: "success!",
			data: results,
		});
	});
});
// 删除视频
router.post("/delDaily", function (req, res) {
	let {
		id
	} = req.body;
	//拼接SQL

	let sql =

		`DELETE FROM daily WHERE id = ?`
	//判断是否登录用户？

	db.query(sql, [id], function (results, fields) {
		//成功
		res.json({
			status: true,
			msg: "success!",
			data: results,
		});
	});
});
// 编辑视频
router.post("/updateDaily", function (req, res) {
	let {
		id,
		content,
		img_url,
		date,
		from,
		day,
		month,
	} = req.body;
	//拼接SQL

	let sql =

		`UPDATE daily SET content = ?, imgUrl = ?, create_date = ? , day = ? , month =?  WHERE id = ?`
	//判断是否登录用户？

	db.query(sql, [content, img_url, date, id], function (results, fields) {
		//成功
		res.json({
			status: true,
			msg: "success!",
			data: results,
		});
	});
});



module.exports = router;