<?php
header('Content-Type: application/json');
$method = $_SERVER['REQUEST_METHOD'];
$file = 'tasks.json';

// Inicializa el archivo JSON si no existe
if (!file_exists($file)) {
    file_put_contents($file, json_encode([]));
}

$tasks = json_decode(file_get_contents($file), true);

switch ($method) {
    case 'GET':
        echo json_encode($tasks);
        break;
    case 'POST':
        $data = json_decode(file_get_contents('php://input'), true);
        if (!isset($data['title']) || !isset($data['description'])) {
            http_response_code(400);
            echo json_encode(['error' => 'Datos incompletos']);
            break;
        }
        $newTask = [
            'id' => uniqid(),
            'title' => $data['title'],
            'description' => $data['description'],
            'status' => 'pendiente'
        ];
        $tasks[] = $newTask;
        file_put_contents($file, json_encode($tasks));
        echo json_encode($newTask);
        break;
    case 'PUT':
        $data = json_decode(file_get_contents('php://input'), true);
        $found = false;
        foreach ($tasks as &$task) {
            if ($task['id'] === $data['id']) {
                $task['title'] = $data['title'] ?? $task['title'];
                $task['description'] = $data['description'] ?? $task['description'];
                $task['status'] = $data['status'] ?? $task['status'];
                $found = true;
                break;
            }
        }
        if (!$found) {
            http_response_code(404);
            echo json_encode(['error' => 'Tarea no encontrada']);
        } else {
            file_put_contents($file, json_encode($tasks));
            echo json_encode($task);
        }
        break;
        case 'DELETE':
            // Decodificar la solicitud recibida (el id de la tarea a eliminar)
            case 'DELETE':

                $data = json_decode(file_get_contents('php://input'), true);
            

                $taskExists = false;
                foreach ($tasks as $task) {
                    if ($task['id'] === $data['id']) {
                        $taskExists = true;
                        break;
                    }
                }
            
                // Si la tarea no existe, enviar un mensaje de error
                if (!$taskExists) {
                    echo json_encode(['success' => false, 'message' => 'Tarea no encontrada']);
                } else {
                    $tasks = array_filter($tasks, fn($task) => $task['id'] !== $data['id']);

                    $tasks = array_values($tasks);
                    file_put_contents($file, json_encode($tasks));
            

                    echo json_encode(['success' => true]);
                }
                break;
            

    default:
        http_response_code(405);
        echo json_encode(['error' => 'Método no permitido']);
}
