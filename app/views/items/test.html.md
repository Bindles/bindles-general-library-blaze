<!-- <style> -->
<!-- .wrapper { -->
  <!-- display: grid; -->
<!-- } -->
<!-- .parent { -->
  <!-- display: grid; -->
  <!-- height: 300px; -->
<!-- }   -->
<!-- table { -->
  <!-- border-style: solid; -->
  <!-- border-width: 5px; -->
  <!-- border-color: red; -->
<!-- } -->
<!-- </style> -->

<style>
  .parent {
    display: grid;
    grid-template-columns: 25% 75%;
    border-style: solid;
  }
</style>

<div class="parent">
  <div class="child">1</div>
  <div class="child">2</div>
  <div class="child">2</div>
</div>

<table>
  <tbody>
    <!-- First row -->
    <tr>
      <!-- Cells in the first row -->
      <td>a</td>
      <td>bb</td>
      <td>c</td>
    </tr>
    <!-- Second row -->
    <tr>
      <!-- Cells in the second row -->
      <td></td>
      <td></td>
      <td></td>
    </tr>
  </tbody>
</table>

hi