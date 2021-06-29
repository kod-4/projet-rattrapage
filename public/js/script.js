window.onload = () => {
    const etoiles = document.querySelectorAll(".fa-star");
    const note = document.getElementById("note");
    for(etoile of etoiles) {
        etoile.addEventListener("mouseover", function(){
            reinitialisation();
            this.style.color = "yellow";

            let eltPrecedent = this.previousElementSibling;
            while(eltPrecedent) {
                eltPrecedent.style.color="yellow";
                eltPrecedent = eltPrecedent.previousElementSibling;
            }
        });

        etoile.addEventListener("click", function(){
            note.value = this.dataset.id;
        });
        etoile.addEventListener("mouseout", function(){
            reinitialisation(note.value) 
        });
    }
    function reinitialisation(valeur = 0) {
        for(etoile of etoiles) {
            if(etoile.dataset.id > valeur) {
                etoile.style.color = "black";
            } else{
                etoile.style.color = "yellow";
            }
        }
    }
    document.querySelectorAll("[data-reponse]").forEach(element => {
        element.addEventListener("click", function(){
            document.getElementById("comments_reponseid").value = this.dataset.id;
            console.log(this);
        });
    });
}