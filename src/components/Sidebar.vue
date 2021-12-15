<template>
  <div class="cart_mask">
    <div class="cart_body">
      <img src="../assets/img/close.svg" alt="close image" class="cart_close_image" @click="toggle">
      <table class="cart-table">
        <thead>
          <tr>
            <th>Product</th>
            <th>Price</th>
            <th>Qty</th>
            <th>Total</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(quantity, key, i) in cart" :key="i">
            <td>{{ key }}</td>
            <td>${{ getPrice(key) }}</td>
            <td class="center">{{ quantity }}</td>
            <td>${{ (quantity * getPrice(key)).toFixed(2) }}</td>
            <td class="center"><button @click="remove(key)">&times;</button></td>
          </tr>
        </tbody>
      </table>

      <div>
        <span><strong>Total:</strong>${{ calculateTotal() }}</span>
        <button>Checkout</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ['toggle', 'inventory', 'cart', 'remove'],
  // 這裡動態計算價錢，總價錢用 methods 之所以可以，是因為只要 cart 有東西, 就會被 v-for 觸發
  methods: {
    getPrice (name) {
      const product = this.inventory.find((p) => {
        return p.name === name
      })
      return product.price.USD
    },
    calculateTotal () {
      const total = Object.entries(this.cart).reduce((acc, curr, index) => {
        // curr[1] 數量, curr[0] 商品名稱
        return parseFloat((acc + (curr[1] * this.getPrice(curr[0]))).toFixed(2))
      }, 0)
      return total
    }
  }
}
</script>
