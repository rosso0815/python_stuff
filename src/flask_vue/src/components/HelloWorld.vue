<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
    <button v-on:click="greet">Greet</button>
  </div>
</template>

<script>

const OpenAPIClientAxios = require("openapi-client-axios").default;
const api = new OpenAPIClientAxios({
  definition: "/api/swagger.json",
});

export default {
  name: "HelloWorld",
  props: {
    msg: String,
  },
  methods: {
    greet: function () {
      // alert("Hello " + this.name + "! " + event.target.tagName);
      api
        .init()
        .then((client) => client.getUsers())
        .then((res) => console.log("Here is pet id:1 from the api", res.data));
    },
  },
};
</script>
