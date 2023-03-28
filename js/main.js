document.addEventListener("DOMContentLoaded", function(event) {
    keyPress('nombreApellidos');
    keyPress('numeroPersonas');
    keyPress('fechaReserva');
    keyPress('email');
});

//Abrir y cerrar el modal
const openModal = (modal) => document.getElementById(modal).style.display = "block";
const closeModal  = (modal) => document.getElementById(modal).style.display = "";
// Cuando el usuario haga click en cualquier parte fuera del modal, se cierra
window.onclick = (event) => event.target == document.getElementById("myModalReserva") ? closeModal("myModalReserva") : ""



function keyPress(inputName){

    // Get the input field
    var input = document.getElementById(inputName);
    console.log(input)
    // Execute a function when the user presses a key on the keyboard
    input.addEventListener("keypress", function(event) {
        // If the user presses the "Enter" key on the keyboard
        if (event.key === "Enter") {
            // Cancel the default action, if needed
            event.preventDefault();
            // Trigger the button element with a click
            sendReserva()
        }
    });
}




