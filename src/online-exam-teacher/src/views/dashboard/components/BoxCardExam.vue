<template>
  <el-card class="box-card-component">
    <div><ScoreChart></ScoreChart></div>
  </el-card>
</template>

<script>
  import ScoreChart from '../../student/scoreChart.vue'
import { mapGetters } from 'vuex'
import PanThumb from '@/components/PanThumb'
import Mallki from '@/components/TextHoverEffect/Mallki'

export default {
  components: { PanThumb, Mallki },

  filters: {
    statusFilter(status) {
      const statusMap = {
        success: 'success',
        pending: 'danger'
      }
      return statusMap[status]
    }
  },
  data() {
    return {
      teaImg: require('@/assets/images/teacher.jpg'),
      statisticsData: {
        article_count: 1024,
        pageviews_count: 1024
      }
    }
  },
  components:{ScoreChart},
  computed: {
    ...mapGetters([
      'userInfo'
    ])
  }
}
</script>

<style lang="scss" >
.box-card-component{
  .el-card__header {
    padding: 0px!important;
  }
}
</style>
<style type="text/scss" lang="scss" scoped>
.box-card-component {
  .box-card-header {
    position: relative;
    height: 20px;
    img {
      width: 100%;
      height: 100%;
      transition: all 0.2s linear;
      &:hover {
        transform: scale(1.1, 1.1);
        filter: contrast(130%);
      }
    }
  }
  .mallki-text {
    position: absolute;
    top: 0px;
    right: 0px;
    font-size: 20px;
    font-weight: bold;
  }
  .panThumb {
    z-index: 100;
    height: 70px!important;
    width: 70px!important;
    position: absolute!important;
    top: -45px;
    left: 0px;
    border: 5px solid #ffffff;
    background-color: #fff;
    margin: auto;
    box-shadow: none!important;
    /deep/ .pan-info {
      box-shadow: none!important;
    }
  }
  .progress-item {
    margin-bottom: 10px;
    font-size: 14px;
    .info_item {
      display: flex;
      justify-content: space-between;
      padding-right: 50px;
    }
  }
  /*@media only screen and (max-width: 1510px){
    .mallki-text{
      display: none;
    }
  }*/
}
</style>
