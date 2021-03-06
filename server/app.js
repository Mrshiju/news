var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
const expressJwt = require('express-jwt');
var cors = require('cors');

var index = require('./routes/index');

let article = require('./routes/admin/article');
var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

// uncomment after placing your favicon in /public
//app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

// 设置跨域资源分享CORS
app.use(cors());

//使用中间件验证token合法性
// app.use(expressJwt({ secret: 'secret' }).unless({
//     path: ['/', '/api/user/login', '/api/user/register', '/api/goods/list', '/api/goods/detail', '/api/category/sub', '/api/admin/register', '/api/admin/login'] //除了这些地址，其他的URL都需要验证
// }));

app.use('/', index);
// 查询文章列表
app.use('/admin/index', article);
// 处理401错误
app.use(function (err, req, res, next) {
    if (err.name === 'UnauthorizedError') {
        res.status(401).json({
            status: false,
            ...err,
        });
    }
});
// catch 404 and forward to error handler
app.use(function (req, res, next) {
    var err = new Error('Not Found');
    err.status = 404;
    next(err);
});

// error handler
app.use(function (err, req, res, next) {
    // set locals, only providing error in development
    res.locals.message = err.message;
    res.locals.error = req.app.get('env') === 'development' ? err : {};

    // render the error page
    res.status(err.status || 500);
    res.render('error');
});

module.exports = app;
