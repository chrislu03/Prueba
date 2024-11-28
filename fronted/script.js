// Guardamos en la variable las etiquetas que vamos a utilizar

const taskForm = document.getElementById('taskForm');
const taskList = document.getElementById('taskList');

// Agregamos un evento a la etiqueta Form con su id

let editingTaskId = null;  

taskForm.addEventListener('submit', async (e) => {
    e.preventDefault(); 

    const title = document.getElementById('title').value;
    const description = document.getElementById('description').value;

    if (editingTaskId) {
        // Si estamos editando una tarea, hacemos una solicitud PUT
        const response = await fetch('http://127.0.0.1/Prueba_Tecnica/backend/index.php', {
            method: 'PUT',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ id: editingTaskId, title, description })
        });

        if (response.ok) {
            loadTasks(); 
            resetForm(); 
        }
    } else {
        // Si estamos agregando una tarea, hacemos una solicitud POST
        const response = await fetch('http://127.0.0.1/Prueba_Tecnica/backend/index.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ title, description })
        });

        if (response.ok) {
            loadTasks(); 
            resetForm(); 
        }
    }
});

// Función para resetear el formulario y salir del modo edición
function resetForm() {
    document.getElementById('title').value = '';
    document.getElementById('description').value = '';
    editingTaskId = null; // Reiniciar la tarea que estamos editando

    // Restablecer el texto del botón a "Agregar tarea"
    const submitButton = document.querySelector('button[type="submit"]');
    submitButton.textContent = 'Agregar tarea'; // Cambiar el texto del botón
}


// Aca se hace un GET

async function loadTasks() {
    // Realiza una solicitud GET para obtener las tareas
    const response = await fetch('http://127.0.0.1/Prueba_Tecnica/backend/index.php');
    const tasks = await response.json();

    // Limpiar la lista de tareas antes de volver a cargar
    taskList.innerHTML = '';

    // Iterar sobre las tareas y agregar un botón de eliminar y actualizar
    tasks.forEach(task => {
        const li = document.createElement('li');
        li.textContent = `${task.title} - ${task.status}`;

        // Crear el botón de eliminar
        const deleteButton = document.createElement('button');
        deleteButton.textContent = 'Eliminar';
        deleteButton.style.marginLeft = '10px'; // Añadir margen

        // Añadir un evento al botón de eliminar
        deleteButton.addEventListener('click', () => {
            // Llamar a la función deleteTask con el id de la tarea
            deleteTask(task.id);
        });

        // Crear el botón de actualizar
        const updateButton = document.createElement('button');
        updateButton.textContent = 'Actualizar';
        updateButton.style.marginLeft = '10px'; // Añadir margen

        // Añadir un evento al botón de actualizar
        updateButton.addEventListener('click', () => {
            // Llamar a la función updateTask con los datos de la tarea
            updateTask(task);
        });

        // Añadir los botones de eliminar y actualizar al elemento li
        li.appendChild(deleteButton);
        li.appendChild(updateButton);

        // Añadir la tarea al listado
        taskList.appendChild(li);
    });
}


async function deleteTask(id) {
    // Realizar la solicitud DELETE a la API
    const response = await fetch('http://127.0.0.1/Prueba_Tecnica/backend/index.php', {
        method: 'DELETE',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ id })
    });

    const result = await response.json();

    // Si la eliminación es exitosa, recargar las tareas
    if (result.success) {
        loadTasks(); // Recargar las tareas
    } else {
        alert(result.message); // Mostrar mensaje de error si la tarea no se encuentra
    }
}

//update

async function updateTask(task) {
    // Establecer el ID de la tarea que se va a editar
    editingTaskId = task.id;

    // Rellenar el formulario de edición con los valores actuales de la tarea
    document.getElementById('title').value = task.title;
    document.getElementById('description').value = task.description;

    // Cambiar el texto del botón de submit (si deseas mostrar algo como 'Actualizar')
    document.querySelector('button[type="submit"]').textContent = 'Actualizar Tarea';
}



loadTasks();

taskForm.addEventListener('submit', async (e) => {
     // Prevenir que el formulario se envíe por defecto

    const title = document.getElementById('title').value;
    const description = document.getElementById('description').value;

    // Realizar la solicitud POST para agregar la tarea
    const response = await fetch('http://127.0.0.1/Prueba_Tecnica/backend', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ title, description })
    });

    if (response.ok) {
        loadTasks(); // Recargar las tareas
    }
});

// Función para manejar la eliminación de tareas
async function deleteTask(id) {
    const response = await fetch('http://127.0.0.1/Prueba_Tecnica/backend', {
        method: 'DELETE',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ id })
    });

    const result = await response.json();

    if (result.success) {
        loadTasks(); // Recargar las tareas
    } else {
        alert(result.message); // Mostrar mensaje de error si la tarea no se encuentra
    }
}




