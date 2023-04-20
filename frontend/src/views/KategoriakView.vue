
<template>
  <div>
    <h1>Vásárlók</h1>
    <table class="table">
  <thead>
    <tr>
      <th>Name</th>
      <th>Postal Code</th>
      <th>Settlement</th>
      <th>Street Address</th>
    </tr>
  </thead>
  <tbody v-for="(buyer, index) in buyers"
        :key="`buyer${index}`">
    <tr>
      <td>{{buyer.name}}</td>
      <td>{{buyer.postalCode}}</td>
      <td>{{buyer.settlement}}</td>
      <td>{{buyer.streetAddress}}</td>
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
      buyers: [],
    };
  },
  mounted() {
    this.getBuyers();
  },
  methods: {
    async getBuyers() {
      let url = this.storeUrl.urlBuyers;
      const config = {
        method: "GET",
        headers: {
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
      };
      const response = await fetch(url, config);
      const data = await response.json();
      this.buyers = data.data;
    },
    
  },
};
</script>



<style>
.my-bg-current-row {
  background-color: lightgrey;
}

.invisible {
  visibility: hidden;
}
</style>
