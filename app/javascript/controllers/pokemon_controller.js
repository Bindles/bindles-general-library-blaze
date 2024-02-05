// // app/javascript/controllers/pokemon_controller.js
// import { Controller } from "@hotwired/stimulus"

// export default class extends Controller {
//   async connect() {
//     try {
//       const response = await fetch("https://pokeapi.co/api/v2/pokemon?limit=3");
//       const data = await response.json();
//       this.element.innerHTML = this.renderPokemonList(data.results);
//     } catch (error) {
//       console.error("Error fetching data:", error);
//     }
//   }

//   renderPokemonList(pokemonList) {
//     return `
//       <ul>
//         ${pokemonList.map(pokemon => `<li>${pokemon.name}</li>`).join("")}
//       </ul>
//     `;
//   }
// }


import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["submitBtn"];

  async fetchPokemonData() {
    try {
      const response = await fetch("https://pokeapi.co/api/v2/pokemon?limit=18");
      const data = await response.json();
      this.element.innerHTML = this.renderPokemonList(data.results);
    } catch (error) {
      console.error("Error fetching data:", error);
    }
  }

  renderPokemonList(pokemonList) {
    return `
      <ul>
        ${pokemonList.map(pokemon => `<li>${pokemon.name}</li>`).join("")}
      </ul>
    `;
  }
}
