<template>
  <div class="wrong">
    <HeaderTop title="试卷查看"></HeaderTop>
    <form class="search_form"  @submit.prevent="">
      <input type="search" placeholder="请输入试卷关键字" class="search_input" v-model="keyword" @input="search" @click="showView" >
    </form>
    <section class="wrong_no_login" v-if="!userInfo.sno">
      <i class="iconfont iconc-kongzhuangtai"></i>
      <h3>登录后查看试卷</h3>
      <mt-button @click="$router.push('/login')">立即登录</mt-button>
    </section>



    <!--查看试卷-->
    <div v-if="noSearchPapers">
      <ly-tab
        v-model="selectedId"
        :items="items"
        :options="options"
        v-if="userInfo.sno"
        @change="clickTab">
      </ly-tab>
      <div class="wrong_list_container"   v-show="wrongPapersList.length">
      <mt-loadmore :top-method="loadTop" ref="loadmore" >
        <div class="wrong_list" v-for="(item, index) in wrongPapersList" :key="item.paperId">
          <div class="wrong_list_item" :class="{'corner_new':index == 0}">
            <div class="wrong_title">
              {{item.paperName}}
            </div>
            <div class="wrong_type">
              试卷类型：{{item.paperType == 1 ? '随机组卷' : '固定组卷'}}
            </div>
            <div class="wrong_difficulty">
              <span>难度系数：</span>
              <Star :score="item.paperDifficulty" :size="24" />
            </div>
            <div class="wrong_item">
              最终成绩：<span class="wrong_important">{{item.score || 0}}</span>分{{item.score == null ? '（强制关闭考试页面退出考试）' : ''}}
            </div>
            <div class="wrong_item">
              试卷题数：总共<span class="wrong_important">{{item.totalNum}}</span>道，答错<span class="wrong_important">{{item.totalErrorNum}}</span>道
            </div>
            <div class="wrong_item">
              单选题：总共<span class="wrong_important">{{item.singleNum}}</span>道，答错<span class="wrong_important">{{item.singleErrorNum}}</span>道，每题<span class="wrong_important">{{item.singleScore}}</span>分
            </div>
            <div class="wrong_item">
              多选题：总共<span class="wrong_important">{{item.multipleNum}}</span>道，答错<span class="wrong_important">{{item.multipleErrorNum}}</span>道，每题<span class="wrong_important">{{item.multipleScore}}</span>分
            </div>
            <div class="wrong_item">
              判断题：总共<span class="wrong_important">{{item.judgeNum}}</span>道，答错<span class="wrong_important">{{item.judgeErrorNum}}</span>道，每题<span class="wrong_important">{{item.judgeScore}}</span>分
            </div>
            <div class="wrong_item">
              填空题：总共<span class="wrong_important">{{item.fillNum}}</span>道，答错<span class="wrong_important">{{item.fillErrorNum}}</span>道，每题<span class="wrong_important">{{item.fillScore}}</span>分
            </div>
            <div class="wrong_btn">
              <div>
                <mt-button size="small" type="danger" @click.native="toWrongDetail(item.paperId)" :disabled="item.score == null">查看错题记录</mt-button>
              </div>
              <div>
                <mt-button size="small" type="primary" @click.native="toScoreDetail(item.paperId)" :disabled="item.score == null">查看成绩报告</mt-button>
              </div>
            </div>
          </div>
        </div>
        <div class="bottom_tips">
          <span>我是有底线的</span>
        </div>

      </mt-loadmore>
    </div>
    </div>
    <div v-else>
      <section class="list" v-if="!noSearchPapers">
        <ul class="list_container">
          <router-link :to="'/home/paper/detail/' + item.paperId" tag="li"
                       v-for="item in searchPapers" :key="item.paperId" class="list_li">
            <section class="item_left">
              <img :src="item.langImgSrc" class="restaurant_img">
            </section>
            <section class="item_right">
              <div class="item_right_text">
                <p>
                  <span>{{item.paperName}}</span>
                  <span>试卷类型：{{item.paperType == 1 ? '随机组卷' : '固定组卷'}}</span>
                </p>
                <p>
                  <span>考试时长：{{Math.round(item.paperDuration/60)}}分钟</span>
                  <span>参加人数：{{item.participateNum}}人</span>
                </p>
                <p></p>
                <p>
                  <span>发布时间：{{item.paperCreateTime | date-format}}</span>
                  <Star :score="item.paperDifficulty" :size="24" />
                </p>
              </div>
            </section>
          </router-link>
        </ul>
      </section>

    </div>
    <back-to-top :custom-style="myBackToTopStyle" :visibility-height="300" :back-position="0" transition-name="fade" />

    <div class="no_paper_list" v-if="userInfo.sno && isWrongPapersList">
      <img src="../../common/imgs/nopaperwrong.png" alt="">
      <h3>暂无试卷记录</h3>
    </div>

  </div>
</template>

<script>
import HeaderTop from '../../components/HeaderTop/HeaderTop.vue'
import BackToTop from '../../components/BackToTop'
import Star from '../../components/Star/Star.vue'
import {mapState} from 'vuex'
import {reqWrongLanguagesInfo, reqWrongAllPapers, reqWrongPapersByLangId,reqSearchPapers} from '../../api'
import {Toast, Indicator} from 'mint-ui'
export default {

  name: "",
  data() {
    return {
      // isSel:false,
      keyword: '',
      isSelect:false,
      searchPapers:[],
      noSearchPapers:true,
      tips:'输入关键字即可搜索',
      myBackToTopStyle: {
        right: '16px',
        bottom: '66px',
        width: '40px',
        height: '40px',
        'border-radius': '4px',
        'line-height': '45px', // 请保持与高度一致以垂直居中 Please keep consistent with height to center vertically
        background: '#e7eaf1'// 按钮的背景颜色 The background color of the button
      },
      sno:this.$store.state.userInfo.sno,
      selectedId: 0,
      items:[],
      options: {
        activeColor: '#1d98bd',
        // 可在这里指定labelKey为你数据里文字对应的字段
        labelKey: 'langName'
      },
      wrongPapersList:[],
      isWrongPapersList:false
    }
  },
  created(){
    this.getWrongLanguagesInfo();
    this.getWrongAllPapers();
  },
  methods: {
    showView(){
      this.isSelect=true
    },
    search(){
            if (!this.$store.state.userInfo.sno){
              Toast({
                message:'请先登录系统',
                duration: 1000
              });
            }
            else{
              if (!this.keyword) {
    /*            Toast({
                  message:'输入试卷关键字为空！',
                  duration: 1000
                });*/
                this.noSearchPapers = true;
                this.tips = '输入试卷关键字为空';
              }
              else {
                this.keyword = this.keyword.trim();
                this.getSearchPapers();
              }
            }
          },
          async getSearchPapers(){
            const {keyword} = this;
            let result = await reqSearchPapers({keyword});
            if (result.statu == 0){
              this.searchPapers = result.data;
              this.noSearchPapers = false;
              this.tips = '搜索成功';
            }
            else {
              this.noSearchPapers = true;
              this.tips = '该关键字暂无搜索结果';
            }
          },
          toggleSelect(){
            this.isSelect=!this.isSelect
          },
    loadTop() {
      if (this.selectedId === 0){
        this.getWrongAllPapers();
      } else {
        this.getWrongPapersByLangId(this.selectedId);
      }
      setTimeout(() => {
        this.$refs.loadmore.onTopLoaded()
      }, 1000)
    },
    async getWrongLanguagesInfo(){
      let result = await reqWrongLanguagesInfo();
      if (result.statu == 0){
        this.items = result.data
      }
      else {
        Toast({
          message:result.msg,
          duration: 1500
        });
      }
    },
    async getWrongAllPapers(){
      const {sno} = this;
      let result = await reqWrongAllPapers({sno});
      if (result.statu == 0){
        this.wrongPapersList = result.data;
      }
      else {
        Toast({
          message:result.msg,
          duration: 1500
        });
      }
    },
    async getWrongPapersByLangId(langId){
      let result = await reqWrongPapersByLangId(this.sno, langId);
      if (result.statu == 0){
        this.wrongPapersList = result.data
      }
      else {
        Toast({
          message:result.msg,
          duration: 1500
        });
      }
    },
    clickTab(item, index){
      if (item.langId == 0){
        this.getWrongAllPapers();
      }
      else {
        this.getWrongPapersByLangId(item.langId);
      }
    },
    toScoreDetail(paperId){
      this.$router.push('/profile/stuscore/detail/' + paperId)
    },
    toWrongDetail(paperId){
      this.$router.push('/wrong/detail/' + paperId)
    }
  },
  components:{
    HeaderTop,
    Star,
    BackToTop,
  },

  computed:{
    ...mapState(['userInfo'])
  },
  //监听wrongPapersList长度，确定是否显示暂无错题图标
  watch:{
    wrongPapersList (value) {
      if (!value.length){
        this.isWrongPapersList = true;
      }
      else {
        this.isWrongPapersList = false;
      }
    }
  }
}
</script>

<style lang="stylus" type="text/stylus" rel="stylesheet/stylus" scoped>
@import "../../common/stylus/mixins.styl"
.opacity
    opacity 0.4
    background #e5e5e5
.search_form
      clearFix()
      background-color #fff
      padding 12px 8px
      input
        height 35px
        padding 0 4px
        border-radius 2px
        font-weight bold
        outline none
        &.search_input
          float left
          width 100%
          border 4px solid #f2f2f2
          font-size 14px
          color #333
          background-color #f2f2f2
        &.search_submit
          float right
          width 18%
          border 4px solid #4ab8a1
          font-size 16px
          color #fff
          background-color #4ab8a1
.list
      .list_container
        background-color: #fff;
        .list_li
          display: flex;
          justify-content: center;
          padding: 10px
          border-bottom: 1px solid $bc;
          .item_left
            margin-right: 10px
            .restaurant_img
              width 50px
              height 50px
              display block
          .item_right
            font-size 12px
            flex 1
            .item_right_text
              p
                line-height 12px
                margin-bottom 6px
                display flex
                justify-content space-between
                &:last-child
                  margin-bottom 0

.wrong  //错题
  width 100%
  padding-top 45px
  padding-bottom 50px
  background-color #f5f5f5
  .wrong_no_login
    padding-top 100px
    width 60%
    margin 0 auto
    text-align center
    >i
      display block
      font-size 180px
      color #4ab8a1
    >h3
      padding 20px 0
      font-size 17px
      color #6a6a6a
    >button
      display inline-block
      background #4ab8a1
      font-size 14px
      color #fff
      border 0
      outline none
      border-radius 5px
      padding 10px 20px
  .no_paper_list
    display flex
    padding-top 100px
    flex-direction column
    align-items center
    >img
      width 250px
      height 250px
    >h3
      font-size 17px
      color #6a6a6a
  .wrong_list_container
    margin-top 20px
    .wrong_list
      width 100%
      display flex
      flex-direction column
      .wrong_list_item
        width 80%
        margin 0 auto
        margin-bottom 20px
        padding 25px 20px 20px 20px
        background-color #fff
        background-image url("../../common/imgs/corner-wrong.png"), url("../../common/imgs/paper-right-top.png"), url("../../common/imgs/corner-wrong-join.png")
        background-size 30px 30px, 40px 40px, 50px 50px
        background-repeat no-repeat, no-repeat, no-repeat
        background-position 50% 1%, 100% 0%, 92% 6%
        border-radius 5px
        box-shadow 0 0 3px #ccc
        &.corner_new
          background-image url("../../common/imgs/corner-wrong.png"), url("../../common/imgs/paper-right-top.png"), url("../../common/imgs/corner-mark-new.png"), url("../../common/imgs/corner-wrong-join.png")
          background-size 30px 30px, 40px 40px,40px 40px, 50px 50px
          background-repeat no-repeat, no-repeat, no-repeat, no-repeat
          background-position 50% 1%, 100% 0%, 0% 0%, 92% 6%
        .wrong_title
          height 50px
          line-height 50px
          font-size 16px
          display flex
          justify-content center
        .wrong_type
          height 30px
          line-height 30px
          font-size 14px
          color #999
        .wrong_item
          height 30px
          line-height 30px
          font-size 14px
        .wrong_important
          font-weight bold
          color #d9534f
        .wrong_difficulty
          height 30px
          line-height 30px
          font-size 14px
          color #999
          .star
            display inline-block
            float none
        .wrong_btn
          height 50px
          line-height 50px
          font-size 16px
          display flex
          justify-content space-between
</style>
