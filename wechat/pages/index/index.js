// pages/index/index.js
const {
  severRequest
} = require("../../api/index");
Page({

  /**
   * 页面的初始数据
   */
  data: {
    bannerList: "",
    kindList: "",
    activeKind: 1,
    articleList: "",
    fixed: false,
    loading: true
  },
  onShow() {
    this.getData();
  },
  getData() {
    // 获取banner数据
    let data = {
      isBanner: true
    };
    this.setData({
      bannerList: []
    })
    // severRequest("getBanner", data).then(res => {
    //   this.setData({
    //     bannerList: res.data
    //   })
    // })
    // 获取分类列表数据
    severRequest("getKindList").then(res => {
      this.setData({
        kindList: res.data
      })
      this.changeKind();
    })
  },
  // 切换分类时获取分类数据
  changeKind(e) {

    let data = {
      // id: this.data.activeKind,
      page: 1,
      pageSize: 10
    }
    severRequest("getKindArticle", data).then(res => {
      this.setData({
        articleList: res.goods,
        loading: false
      })
    })
  },
  changeKinds(e) {
    if (e) {
      this.setData({
        activeKind: e.target.dataset.id
      })
    }
    let id = e.target.dataset.id
    switch (id) {
      case 2:
        wx.switchTab({
          url: '/pages/wallpaper/wallpaper',
        })
        break;
      case 3:
        wx.switchTab({
          url: '/pages/audio/wallpaper',
        })
    }
  },
  // 滚动监听
  onPageScroll(e) {
    if (e.scrollTop < 265) {
      this.setData({
        fixed: false
      })
      wx.setNavigationBarTitle({
        title: "",
      })
    } else {
      wx.setNavigationBarTitle({
        title: "新闻",
      })
      this.setData({
        fixed: true
      })
    }
  },
})