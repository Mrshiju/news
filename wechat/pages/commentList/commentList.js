const {
  severRequest
} = require("../../api/index");
const {
  wxToast
} = require("../../utils/wxUtils.js");
Page({

  /**
   * 页面的初始数据
   */
  data: {
    canIUse: true,
    articleId: "",
    commentList: "",
    active: '',
    loading: true,
    focus: false,
    placeHolder: '请输入评论内容',
    msg: '',
    isReply: false,
    replyCommentId: '',
    userInfo: null,
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    wx.getSetting({
      success(res) {
        if (res.authSetting['scope.userInfo']) {
          // 已经授权，可以直接调用 getUserInfo 获取头像昵称
          wx.getUserInfo({
            success: function (res) {
              console.log(res.userInfo)
            }
          })
        }
      }
    })
    wx.setNavigationBarTitle({
      title: options.title + '评论',
    })
    this.setData({
      articleId: options.id
    })
    this.getComments();
  },
  bindGetUserInfo(e) {
    console.log(e.detail.userInfo)
    this.setData({
      userInfo: e.detail.userInfo,
      canIUse:false
    })
  },
  onShow() {
    this.setData({
      focus: true,
    })
  },
  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {
    this.getComments();
  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },
  /**
   * 获取评论列表
   */
  getComments: function () {
    // 获取评论数据
    severRequest("getArticleComment", {
      id: this.data.articleId
    }).then(res => {
      this.setData({
        commentList: res.data,
        loading: false
      })
      // 停止下拉刷新
      wx.stopPullDownRefresh();
    })
  },

  /**
   * 评论点赞
   */
  commentPraise: function (e) {
    let data = e.currentTarget.dataset;
    let that = this;
    wx.request({
      url: HOST + '/wechat/specialCommentPraise',
      data: {
        id: data.commentId,
        praise: data.praise + 1
      },
      success: (res) => {
        that.getComments();
      }
    })
  },
  /**
   * 弹出评论框
   */
  comment: function () {
    this.setData({
      active: 'active',
      focus: true,
      msg: '',
      placeHolder: '请输入评论内容',
      isReply: false
    })
  },
  /**
   * 失去焦点
   */
  inputBlur: function () {
    this.setData({
      focus: false,
    })
  },
  oninput: function (e) {
    let text = e.detail.value;
    this.param = {
      id: this.data.articleId,
      commentText: text,
      user_name: this.data.userInfo.nickName || '微信用户',
      avater: this.data.userInfo.avatarUrl || 'https://thirdwx.qlogo.cn/mmopen/vi_32/DdwGRgUBxJqxiciaPLgUJwYQP5u7eOE7Apmvfq9Pu9Gx4mu2Lzc6ria9n1Yqlfc8KBwicZoSLG8Vy0DvPdSEDD9DSg/132'
    }
  },
  /**
   * 弹出回复框
   */
  reply: function (e) {
    let commentId = e.currentTarget.dataset.commentId;
    let user = e.currentTarget.dataset.user;
    if (this.data.focus) {
      this.setData({
        active: 'active',
        focus: false,
      })
    } else {
      this.setData({
        replyCommentId: commentId,
        active: 'active',
        focus: true,
        placeHolder: '回复 ' + user + ' :',
        isReply: true,
        msg: ''
      })
    }

  },
  /**
   * 提交评论
   */
  sendComment(e) {

    if(this.canIUse){
     wx.showToast({
       title: '请先授权',
     })
      return;
    }
    severRequest("addArticleComment", this.param).then(res => {
      this.getComments();
      this.setData({
        msg: '',
        active: '',
      })
    })
  
},
// sendComment(e) {
//   let text = e.detail.value;
//   if (text.trim() == "") {
//     wxToast("请输入评论内容");
//     return false;
//   }

//   // 评论内容
//   if (!this.data.isReply) {
//     let data = {
//       id: this.data.articleId,
//       commentText: text,
//       user_name:this.data.userInfo.nickName,
//       avater:this.data.userInfo.avatarUrl
//     }
//     severRequest("addArticleComment", data).then(res => {
//       this.getComments();
//       this.setData({
//         msg: '',
//         active: '',
//       })
//     })
//   } else {
//     // 回复评论
//     wx.request({
//       url: HOST + '/wechat/commentSpecialReply',
//       data: {
//         commentId: that.data.replyCommentId,
//         userId: that.data.userId,
//         text: text
//       },
//       success: (res => {
//         that.getComments();
//         that.setData({
//           msg: '',
//           active: '',
//           placeHolder: '请输入评论内容',
//           isReply: false
//         })
//         console.log(res);
//       })
//     })
//   }

// },
})