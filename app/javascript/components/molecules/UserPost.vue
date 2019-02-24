<template lang="pug">
.card
  .card-content
    pre {{ introduction }}
</template>

<script>
export default {
  props: ["introduction"],
};
</script>
