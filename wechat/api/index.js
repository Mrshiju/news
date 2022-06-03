import Promise from "../utils/external/es6-promise.min";

const HOST = "http://localhost:3002";
// const HOST = "http://192.168.1.110:8360";
// const HOST = "https://server.raydom.wang";
// 接口列表
const api = {
  getBanner: "/admin/index/getBanner", // 获取banner
  getKindList: "/admin/index/getKindList", // 获取分类列表
  getKindArticle: "/admin/index/getArticleList", // 获取分类下文章列表
  getArticle: "/admin/index/getArticle", // 根据文章ID获取文章详情
  getArticleComment: "/admin/index/getArticleComment", // 获取文章评论
  viewCount: "/admin/index/viewCount", // 浏览量
  shareCount: "/admin/index/shareCount", // 分享统计
  getAboutDeveloper: "/admin/index/getAboutDeveloper", // 获取关于开发者
  getDailyList: "/admin/index/getDailyList", // 获取精选列表
  dailyPraise: "/admin/index/dailyPraise", // 点赞统计
  dailyDownload: "/admin/index/dailyDownload", // 下载统计
  // 需要登录的接口
  login: "/api/login/index", // 登录接口，code换取openid
  getUserInfo: "/api/user/getUserInfo", // 获取用户信息
  getCollectArticle: "/api/user/getCollectArticle", // 获取用户收藏问文章
  getCommentArticle: "/api/user/getCommentArticle", // 获取用户收藏问文章
  // 文章相关
  addPraise: "/admin/index/updateArticleLike", // 点赞
  addArticleComment: "/admin/index/addArticleComment" // 添加评论


}

// 微信request请求promise封装
function severRequest(apiKey, params = {}, method = "POST") {
  let token = wx.getStorageSync("token") || "";
  return new Promise((resolve, reject) => {
    wx.request({
      url: HOST + api[apiKey],
      method: method,
      data: params,
      header: {
        token
      },
      success(res) {
        if (res.data.status) {
          resolve(res.data);
        } else {
          console.log("错误信息", res.data);
          reject(res.data);
        }
      },
      fail(err) {
        console.log(err)
        reject(err);
      }
    })
  })

}

module.exports = {
  severRequest: severRequest
}