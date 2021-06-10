<template>
  <div class="search">
    <HeaderTop title="试卷搜索"/>
    <form class="search_form" @submit.prevent="">
      <input type="search" placeholder="请输入试卷关键字" class="search_input" v-model="keyword" @input="search">
      <input type="submit" class="search_submit" value="搜索"
             :class="isSelect?'opacity':''" @touchstart="toggleSelect" @touchend="toggleSelect">
    </form>


    <!--关键字搜索试卷列表-->
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

    <section v-else>
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
    </section>

  </div>
</template>

<script>
  import HeaderTop from '../../components/HeaderTop/HeaderTop.vue'
  import Star from '../../components/Star/Star.vue'
  import {mapState} from 'vuex'
  import {Toast} from 'mint-ui'
  import {reqSearchPapers} from '../../api'
  export default {
    name: "",
    data() {
      return {
        keyword: '',
        isSelect:false,
        searchPapers:[],
        noSearchPapers:true,
        tips:'输入关键字即可搜索'
      }
    },
    methods: {
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
/*          Toast({
            message:result.msg,
            iconClass: 'iconfont iconxinxi',
            duration: 2000
          });*/
          this.noSearchPapers = true;
          this.tips = '该关键字暂无搜索结果';
        }
      },
      toggleSelect(){
        this.isSelect = !this.isSelect;
        // this.$router.push("/search")
      }
    },
/*    watch: {
      searchPapers (value) {
        if (!value.length) { // 没有数据
          this.noSearchPapers = true
        } else { // 有数据
          this.noSearchPapers = false
        }
      }
    },*/
    components:{
      HeaderTop,
      Star
    },
    computed:{
      ...mapState(['userInfo'])
    }
  }
</script>

<style lang="stylus" type="text/stylus" rel="stylesheet/stylus" scoped>
  @import "../../common/stylus/mixins.styl"
  .opacity
    opacity 0.4
    background #e5e5e5
  .search
    width 100%
    overflow hidden
    padding-bottom 50px
    padding-top 45px
    background-color #f5f5f5
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
          width 79%
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
    .search_none
      margin: 0 auto
      color: #333
      background-color: #fff
      text-align: center
      margin-top: 0.125rem
    .search_no_login
      padding-top 100px
      width 60%
      margin 0 auto
      text-align center
      >i
        display block
        font-size 100px
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
    .search__login
      display flex
      flex-direction column
      align-items center
      padding-top 80px
      >img
        width 200px
        height 200px
      >h3
        padding 20px 0
        font-size 17px
        color #4ab8a1
        font-weight bold
</style>
