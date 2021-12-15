<template>
  <p>Product</p>
  <div class="productcard_wrapper">
    <ProductCard
      v-for="(product, index) in productInventory"
      :key="product.id"
      :index="index"
      :product="product"
      :addToCart="productAddToCart"
    />
  </div>
</template>

<script>
import ProductCard from '@/components/ProductCard.vue'

export default {
  props: ['productInventory', 'productAddToCart'],
  components: {
    ProductCard
  }
}
</script>
