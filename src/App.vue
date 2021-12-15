<template>
  <div id="nav">
    <router-link to="/">Home</router-link> |
    <router-link to="/about">About</router-link> |
    <router-link to="/product">Product</router-link>
  </div>
  <button @click="toggleSidebar">
    <img src="./assets/img/cart.svg" alt="cart image">
    <span> {{ totalQuantity }}</span>
  </button>
  <router-view :productInventory="inventory" :productAddToCart="addToCart"/>
  <Sidebar
    v-if="showSidebar"
    :toggle="toggleSidebar"
    :inventory="inventory"
    :cart="cart"
    :remove="removeItem"
  />
</template>

<script>
import Sidebar from '@/components/Sidebar.vue'
import food from './food.json'

export default {
  components: {
    Sidebar
  },
  data () {
    return {
      showSidebar: false,
      inventory: food,
      cart: {}
    }
  },
  computed: {
    totalQuantity () {
      return Object.values(this.cart).reduce((acc, curr) => {
        return acc + curr
      }, 0)
    }
  },
  methods: {
    toggleSidebar () {
      this.showSidebar = !this.showSidebar
    },
    closeSidebar () {
      if (this.showSidebar) {
        this.showSidebar = !this.showSidebar
      }
    },
    addToCart (name, quantity) {
      // Step.1
      // 如果商品input數量不存在，此商品的數量就是 0
      // 這個是為了初始化一開始全部商品數量都是 0 ，這樣才可以用數字累加
      if (!this.cart[name]) this.cart[name] = 0
      // Step.2 每按一次加一次 input 輸入的數量
      // 只要 input 是 ex: 0, 1, 01, 02, 20 就是 true
      // input 是空白的話就是 false
      if (quantity) this.cart[name] += quantity
    },
    removeItem (name) {
      delete this.cart[name]
    }
  }
}
</script>

<style lang="scss">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;

  a {
    font-weight: bold;
    color: #2c3e50;

    &.router-link-exact-active {
      color: #42b983;
    }
  }
}
</style>
