<template>
    <div class="productcard_body">
      <div class="productcard_item">{{ product.name }}</div>
      <div class="productcard_item">{{ product.type }}</div>
      <div class="productcard_item">${{ product.price.USD }}</div>
      <div><input type="number" v-model.number="quantity" /></div>
      <div><button @click="addToCart(product.name, quantity)"><img src="../assets/img/cart_plus.svg" alt="cart plus"></button></div>
    </div>
</template>

<script>
export default {
  props: ['product', 'index', 'addToCart'],
  data () {
    return {
      quantity: 0
    }
  }
}
</script>
