<template>
  <div :class="['dashboard-container',{'dashboard-padding' : device !=='mobile'}]">
    <div class="exam_info" style="margin-top:-50px;">
      <ScoreChart></ScoreChart>
    </div>
  </div>
</template>

<script>import ScoreChart from '../student/scoreChart.vue'
import { mapGetters } from 'vuex'
import PanThumb from '@/components/PanThumb'
import BoxCard from './components/BoxCard'

export default {
  name: 'Dashboard',
  components: {
    PanThumb,
    BoxCard,
    ScoreChart
  },
  data() {
    return {
      admImg: require('@/assets/images/admin.png'),
      emptyGif: require('@/assets/images/home_img.png')
    }
  },
  computed: {
    ...mapGetters([
      'userInfo',
      'device'
    ])
  }
}
</script>

<style type="text/scss" rel="stylesheet/scss" lang="scss" scoped>
  .emptyGif {
    display: block;
    width: 45%;
    margin: 0 auto;
  }
  .dashboard {
    &-container {
      background-color: #e3e3e3;
      min-height: 93vh;
    }
    &-padding {
      padding: 50px 60px 0px;
    }
  }
</style>
