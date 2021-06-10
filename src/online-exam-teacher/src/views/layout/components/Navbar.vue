<template>
  <div class="navbar">
    <hamburger :toggle-click="toggleSideBar" :is-active="sidebar.opened" class="hamburger-container" />
    <breadcrumb :class="{ 'mobile-breadcrumb': device !== 'desktop' }" />

    <div class="right-menu">
      <template v-if="device!=='mobile'">
        <screenfull id="screenfull" class="right-menu-item hover-effect" />
      </template>

      <el-dropdown class="avatar-container right-menu-item hover-effect" >
        <div class="avatar-wrapper">
          <img src="@/assets/images/teacher.jpg"  class="user-avatar">
          <i class="el-icon-caret-bottom" />
        </div>
        <el-dropdown-menu slot="dropdown" class="user-dropdown">
          <!-- <router-link class="inlineBlock" to="/"> -->
          <el-dropdown-item style="">
            <div class="progress-item">
              <div class="info_item">
                <span>教师ID</span>
                <span style="float: right;">{{ userInfo.tno }}</span>
              </div>

            </div>
            <div class="progress-item">
              <div class="info_item">
                <span>姓名</span>
                <span style="float: right;"> {{ userInfo.teaName }}</span>
              </div>

            </div>
            <div class="progress-item">
              <div class="info_item">
                <span>性别</span>
                <span style="float: right;">{{ userInfo.teaSex }}</span>
              </div>

            </div>
            <div class="progress-item">
              <div class="info_item">
                <span>邮箱</span>
                <span style="float: right;">{{ userInfo.teaEmail }}</span>
              </div>

            </div>
           <!-- <div class="progress-item">
              <div class="info_item">
                <span>手机号码</span>
                <span style="float: right;">{{ userInfo.teaPhone }}</span>
              </div>

            </div> -->
            <div class="progress-item">
              <div class="info_item">
                <span>最近登录时间</span>
                <span style="float: right;">{{ userInfo.teaLastLoginTime | date-format }}</span>
              </div>

            </div>

          </el-dropdown-item>
          <!-- </router-link> -->
          <div @click="confirmLogOut">
            <el-dropdown-item divided>
              <span style="display:block;float: right;">退出登录</span>
            </el-dropdown-item>
          </div>
        </el-dropdown-menu>
      </el-dropdown>
    </div>
  </div>
</template>

<script>
  import PanThumb from '@/components/PanThumb'
  import Mallki from '@/components/TextHoverEffect/Mallki'
  import {
    mapGetters
  } from 'vuex'
  import Breadcrumb from '@/components/Breadcrumb'
  import Hamburger from '@/components/Hamburger'
  import Screenfull from '@/components/Screenfull'
  import {
    removeStore
  } from '@/utils/mUtils'
  import {
    reqLogOut
  } from '@/api/login'

  export default {
    components: {
      Breadcrumb,
      Hamburger,
      Screenfull,
      PanThumb,
      Mallki
    },
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
    computed: {
      ...mapGetters([
        'sidebar',
        'device',
        'userInfo'
      ])
    },
    methods: {
      toggleSideBar() {
        this.$store.dispatch('ToggleSideBar')
      },
      confirmLogOut() {
        this.$confirm('确定退出登录吗?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.logout()
        }).catch(() => {
          /* this.$message({
             type: 'info',
             message: '已取消删除'
           });*/
        })
      },
      async logout() {
        const result = await reqLogOut()
        if (result.statu === 0) {
          // 移除localStorage中teacherInfo
          removeStore('teacherInfo')
          // 重置vuex中userInfo
          this.$store.dispatch('resetUserInfo')
          this.$message({
            message: result.msg,
            type: 'success'
          })
          // 为了重新实例化vue-router对象 避免bug
          location.reload()
        } else {
          this.$message({
            message: '系统错误，退出登录失败',
            type: 'warning'
          })
        }
      }
    }
  }
</script>

<style type="text/scss" rel="stylesheet/scss" lang="scss" scoped>
  .mobile-breadcrumb {
  width: 50%;
  height: 50px;
  font-size: 8px !important;
  overflow: hidden;
}
.navbar {
  height: 50px;
  line-height: 50px;
  box-shadow: 0 1px 3px 0 rgba(0,0,0,.12), 0 0 3px 0 rgba(0,0,0,.04);
  .hamburger-container {
    line-height: 58px;
    height: 50px;
    float: left;
    padding: 0 10px;
    &:hover {
      background: rgba(0, 0, 0, .025)
    }
  }
  .right-menu {
    float: right;
    height: 100%;
    line-height: 50px;
    .right-menu-item {
      display: inline-block;
      padding: 0 8px;
      height: 100%;
      font-size: 18px;
      color: #5a5e66;
      vertical-align: text-bottom;

      &.hover-effect {
        cursor: pointer;
        transition: background .3s;

        &:hover {
          background: rgba(0, 0, 0, .025)
        }
      }
    }
  }
  .screenfull {
    position: absolute;
    right: 90px;
    top: 16px;
    color: red;
  }
  .avatar-container {
    margin-right: 30px;
    .avatar-wrapper {
      cursor: pointer;
      margin-top: 5px;
      position: relative;
      line-height: initial;
      .user-avatar {
        width: 40px;
        height: 40px;
        border-radius: 50%;
      }
      .el-icon-caret-bottom {
        position: absolute;
        right: -20px;
        top: 25px;
        font-size: 12px;
      }
    }
  }
}
</style>
