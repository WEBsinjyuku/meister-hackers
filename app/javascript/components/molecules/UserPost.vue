<template lang="pug">
.card
  .card-content
    pre {{ content }}
</template>

<script>
export default {
  props: ["content"]
}
</script>
