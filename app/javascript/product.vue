<template>
  <div class="cont" dir="ltr">
    <Carousel perPage=1 autoPlay="true" centerMode="true" autoplayTimeout="2000">
        <Slide v-for="image in images" v-bind:key="image">
            <figure class="image">

                <img v-bind:src="image">
            </figure>
        </Slide>
    </Carousel>
  </div>
</template>

<script>
import { Carousel, Slide } from 'vue-carousel'

export default {
    props: {
        images: Array
    },
    components: {
        Carousel,
        Slide
    },
    data: function () {
        return {
            message: "Hello Product"
        }
    },
    mounted () {
        console.log(this.images[0])
    }
}
</script>

<style scoped>
.cont {
    height: 300px;
}
</style>
