
<template>
  <div>
    <h1>Termékek</h1>
    <table class="table">
  <thead>
    <tr>
      <th>Id</th>
      <th>Name</th>
      <th>Price ($)</th>
    </tr>
  </thead>
  <tbody v-for="(product, index) in products"
        :key="`products${index}`">
    <tr>
      <td>{{product.id}}</td>
      <td>{{product.productName}}</td>
      <td>{{product.price}}</td>
    </tr>
  </tbody>
</table>

    </div>
</template>

<script>
import { useUrlStore } from "@/stores/url";
import { useLoginStore } from "@/stores/login";
const storeUrl = useUrlStore();
const storeLogin = useLoginStore();

export default {
  data() {
    return {
      storeUrl,
      storeLogin,
      products: [],
    };
  },
  mounted() {
    this.getProducts();
  },
  methods: {
    async getProducts() {
    //   let url = this.storeUrl.urlProducts;
      let url = "http://localhost:3000/products";
      const config = {
        method: "GET",
        headers: {
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
      };
      const response = await fetch(url, config);
      const data = await response.json();
      this.products = data.data;
    },
    
  },
};
</script>


<style>

</style>
