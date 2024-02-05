import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="formelement"
export default class extends Controller {
  static targets = ["submitbtn",]
  connect() {

    fetch('https://pokeapi.co/api/v2/pokemon?limit=3')
      .then(response => response.json())
      .then(data => {
        this.renderPokemonList(data.results);
      })
      .catch(error => {
        console.error('Error fetching Pokemon data:', error);
      });
  }

  renderPokemonList(pokemonResults) {
    const pokemonList = this.pokemonListTarget;
    pokemonList.innerHTML = ''; // Clear existing content

    pokemonResults.forEach(pokemon => {
      const listItem = document.createElement('li');
      listItem.textContent = pokemon.name;
      pokemonList.appendChild(listItem);
    });
  


    console.log('asses')
    this.submitbtnTarget.hidden = false
  }

  remotesubmit() {
    console.log('asa')
    this.submitbtnTarget.click()
  }
}


//'https://pokeapi.co/api/v2/pokemon?limit=3'


// import { Controller } from "@hotwired/stimulus"

// // Connects to data-controller="formelement"
// export default class extends Controller {
//   static targets = ["submitbtn"]

//   connect() {
//     console.log('connected')
//     this.submitbtnTarget.hidden = false
//   }

//   remotesubmit() {
//     console.log('remotesubmit')
//     this.submitbtnTarget.click()
//     this.displayFlashMessage()
//   }

//   displayFlashMessage() {
//     const flashNotice = document.querySelector('.flash-notice')
//     if (flashNotice) {
//       flashNotice.textContent = "cool"
//     }
//   }
// }