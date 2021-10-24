<template>
  <div class="cont" dir="ltr">
    <Carousel :perPage=1 :auto-play="true" :centerMode="true" :autoplayTimeout="2000">
        <Slide v-for="image in images" v-bind:key="image">
            <figure class="image">

                <img v-bind:src="image" height=300>
            </figure>
        </Slide>
    </Carousel>

    <!--<b-carousel
      id="carousel-1"
      v-model="slide"
      :interval="4000"
      controls
      indicators
      background="#ababab"
      img-width="1024"
      img-height="480"
      style="text-shadow: 1px 1px 2px #333;"
    >
        <span v-for="image in images" v-bind:key="image">
            <b-carousel-slide img-src="image"></b-carousel-slide>
        </span>
    </b-carousel>-->
  </div>
</template>

<script>
import { Carousel, Slide } from 'vue-carousel'
// import { Carousel3d, Slide } from 'vue-carousel-3d'

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
            message: "Hello Product",
            slide: 0
        }
    },
    mounted () {
        console.log(this.images[0])
    }
}
</script>

<style scoped>
.cont {
    /*height: 300px;*/
}
</style>
