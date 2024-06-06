// script.js
document.addEventListener('DOMContentLoaded', function() {
    const contactForm = document.getElementById('contactForm');
    contactForm.addEventListener('submit', function(event) {
        if (!contactForm.checkValidity()) {
            event.preventDefault();
            event.stopPropagation();
        }
        contactForm.classList.add('was-validated');
    });

    // Funcionalidad de preguntas frecuentes
    const questions = document.querySelectorAll('.faq-question');
    questions.forEach(question => {
        question.addEventListener('click', function() {
            const target = this.getAttribute('data-target');
            const answer = document.getElementById(target);
            answer.classList.toggle('d-none');
        });
    });
});

//Configurar el Frontend para Hacer Peticiones a la API desde el Formulario de contacto

document.getElementById('contactForm').addEventListener('submit', function(event) {
    event.preventDefault();
    if (!this.checkValidity()) {
        event.stopPropagation();
        this.classList.add('was-validated');
        return;
    }
    const formData = new FormData(this);
    const data = {
        endpoint: 'contacto',
        nombre: formData.get('nombre'),
        email: formData.get('email'),
        direccion: formData.get('direccion'),
        mensaje: formData.get('mensaje')
    };
    fetch('http://localhost/terrasol_backend/api.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
    .then(response => response.json())
    .then(result => {
        if (result.message === 'Contacto guardado') {
            alert('Mensaje enviado correctamente');
            this.reset();
            this.classList.remove('was-validated');
        } else {
            alert('Error al enviar el mensaje');
        }
    })
    .catch(error => console.error('Error:', error));
});