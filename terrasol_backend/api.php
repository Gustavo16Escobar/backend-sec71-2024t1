<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST, PUT, PATCH, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include 'conexion.php';

$method = $_SERVER['REQUEST_METHOD'];
$request = explode('/', trim($_SERVER['PATH_INFO'],'/'));
$endpoint = array_shift($request);

switch ($method) {
    case 'GET':
        handleGet($conn, $endpoint, $request);
        break;
    case 'POST':
        handlePost($conn, $endpoint);
        break;
    case 'PUT':
    case 'PATCH':
        handlePutPatch($conn, $endpoint, $request);
        break;
    case 'DELETE':
        handleDelete($conn, $endpoint, $request);
        break;
    default:
        echo json_encode(["message" => "Método no soportado"]);
        break;
}

function handleGet($conn, $endpoint, $request) {
    switch ($endpoint) {
        case 'categoria_servicio':
            getCategoriasServicio($conn);
            break;
        case 'info_contacto':
            getInfoContacto($conn);
            break;
        case 'historia':
            getHistorias($conn);
            break;
        case 'pregunta_frecuente':
            getPreguntasFrecuentes($conn);
            break;
        case 'parcela':
            getParcelas($conn);
            break;
        default:
            echo json_encode(["message" => "Endpoint no encontrado"]);
            break;
    }
}

function handlePost($conn, $endpoint) {
    $data = json_decode(file_get_contents("php://input"), true);
    switch ($endpoint) {
        case 'categoria_servicio':
            postCategoriaServicio($conn, $data);
            break;
        case 'info_contacto':
            postInfoContacto($conn, $data);
            break;
        case 'historia':
            postHistoria($conn, $data);
            break;
        case 'pregunta_frecuente':
            postPreguntaFrecuente($conn, $data);
            break;
        case 'parcela':
            postParcela($conn, $data);
            break;
        default:
            echo json_encode(["message" => "Endpoint no encontrado"]);
            break;
    }
}

function handlePutPatch($conn, $endpoint, $request) {
    $data = json_decode(file_get_contents("php://input"), true);
    $id = array_shift($request);
    switch ($endpoint) {
        case 'categoria_servicio':
            updateCategoriaServicio($conn, $data, $id);
            break;
        case 'info_contacto':
            updateInfoContacto($conn, $data, $id);
            break;
        case 'historia':
            updateHistoria($conn, $data, $id);
            break;
        case 'pregunta_frecuente':
            updatePreguntaFrecuente($conn, $data, $id);
            break;
        case 'parcela':
            updateParcela($conn, $data, $id);
            break;
        default:
            echo json_encode(["message" => "Endpoint no encontrado"]);
            break;
    }
}

function handleDelete($conn, $endpoint, $request) {
    $id = array_shift($request);
    switch ($endpoint) {
        case 'categoria_servicio':
            deleteCategoriaServicio($conn, $id);
            break;
        case 'info_contacto':
            deleteInfoContacto($conn, $id);
            break;
        case 'historia':
            deleteHistoria($conn, $id);
            break;
        case 'pregunta_frecuente':
            deletePreguntaFrecuente($conn, $id);
            break;
        case 'parcela':
            deleteParcela($conn, $id);
            break;
        default:
            echo json_encode(["message" => "Endpoint no encontrado"]);
            break;
    }
}

// Funciones para manejar cada endpoint

function getCategoriasServicio($conn) {
    $sql = "SELECT * FROM categoria_servicio";
    $result = $conn->query($sql);
    $categorias = array();
    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            $categorias[] = $row;
        }
    }
    echo json_encode($categorias);
}

function postCategoriaServicio($conn, $data) {
    $nombre = $data['nombre'];
    $imagen = $data['imagen'];
    $texto = $data['texto'];
    $activo = $data['activo'];

    $sql = "INSERT INTO categoria_servicio (nombre, imagen, texto, activo) VALUES ('$nombre', '$imagen', '$texto', '$activo')";
    if ($conn->query($sql) === TRUE) {
        echo json_encode(array("message" => "Categoría de servicio guardada"));
    } else {
        echo json_encode(array("message" => "Error: " . $sql . "<br>" . $conn->error));
    }
}

function updateCategoriaServicio($conn, $data, $id) {
    $nombre = $data['nombre'];
    $imagen = $data['imagen'];
    $texto = $data['texto'];
    $activo = $data['activo'];

    $sql = "UPDATE categoria_servicio SET nombre='$nombre', imagen='$imagen', texto='$texto', activo='$activo' WHERE id=$id";
    if ($conn->query($sql) === TRUE) {
        echo json_encode(array("message" => "Categoría de servicio actualizada"));
    } else {
        echo json_encode(array("message" => "Error: " . $sql . "<br>" . $conn->error));
    }
}

function deleteCategoriaServicio($conn, $id) {
    $sql = "DELETE FROM categoria_servicio WHERE id=$id";
    if ($conn->query($sql) === TRUE) {
        echo json_encode(array("message" => "Categoría de servicio eliminada"));
    } else {
        echo json_encode(array("message" => "Error: " . $sql . "<br>" . $conn->error));
    }
}



// Ejemplos para info_contacto

function getInfoContacto($conn) {
    $sql = "SELECT * FROM info_contacto";
    $result = $conn->query($sql);
    $contactos = array();
    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            $contactos[] = $row;
        }
    }
    echo json_encode($contactos);
}

function postInfoContacto($conn, $data) {
    $nombre = $data['nombre'];
    $email = $data['email'];
    $telefono = $data['telefono'];
    $mensaje = $data['mensaje'];

    $sql = "INSERT INTO info_contacto (nombre, email, telefono, mensaje) VALUES ('$nombre', '$email', '$telefono', '$mensaje')";
    if ($conn->query($sql) === TRUE) {
        echo json_encode(array("message" => "Información de contacto guardada"));
    } else {
        echo json_encode(array("message" => "Error: " . $sql . "<br>" . $conn->error));
    }
}



// Ejemplos para historia

function getHistorias($conn) {
    $sql = "SELECT * FROM historia";
    $result = $conn->query($sql);
    $historias = array();
    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            $historias[] = $row;
        }
    }
    echo json_encode($historias);
}

function postHistoria($conn, $data) {
    $titulo = $data['titulo'];
    $contenido = $data['contenido'];
    $imagen = $data['imagen'];

    $sql = "INSERT INTO historia (titulo, contenido, imagen) VALUES ('$titulo', '$contenido', '$imagen')";
    if ($conn->query($sql) === TRUE) {
        echo json_encode(array("message" => "Historia guardada"));
    } else {
        echo json_encode(array("message" => "Error: " . $sql . "<br>" . $conn->error));
    }
}

function updateHistoria($conn, $data, $id) {
    $titulo = $data['titulo'];
    $contenido = $data['contenido'];
    $imagen = $data['imagen'];

    $sql = "UPDATE historia SET titulo='$titulo', contenido='$contenido', imagen='$imagen' WHERE id=$id";
    if ($conn->query($sql) === TRUE) {
        echo json_encode(array("message" => "Historia actualizada"));
    } else {
        echo json_encode(array("message" => "Error: " . $sql . "<br>" . $conn->error));
    }
}

function deleteHistoria($conn, $id) {
    $sql = "DELETE FROM historia WHERE id=$id";
    if ($conn->query($sql) === TRUE) {
        echo json_encode(array("message" => "Historia eliminada"));
    } else {
        echo json_encode(array("message" => "Error: " . $sql . "<br>" . $conn->error));
    }
}

// Ejemplos para pregunta_frecuente

function getPreguntasFrecuentes($conn) {
    $sql = "SELECT * FROM pregunta_frecuente";
    $result = $conn->query($sql);
    $preguntas = array();
    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            $preguntas[] = $row;
        }
    }
    echo json_encode($preguntas);
}

function postPreguntaFrecuente($conn, $data) {
    $pregunta = $data['pregunta'];
    $respuesta = $data['respuesta'];

    $sql = "INSERT INTO pregunta_frecuente (pregunta, respuesta) VALUES ('$pregunta', '$respuesta')";
    if ($conn->query($sql) === TRUE) {
        echo json_encode(array("message" => "Pregunta frecuente guardada"));
    } else {
        echo json_encode(array("message" => "Error: " . $sql . "<br>" . $conn->error));
    }
}

function updatePreguntaFrecuente($conn, $data, $id) {
    $pregunta = $data['pregunta'];
    $respuesta = $data['respuesta'];

    $sql = "UPDATE pregunta_frecuente SET pregunta='$pregunta', respuesta='$respuesta' WHERE id=$id";
    if ($conn->query($sql) === TRUE) {
        echo json_encode(array("message" => "Pregunta frecuente actualizada"));
    } else {
        echo json_encode(array("message" => "Error: " . $sql . "<br>" . $conn->error));
    }
}

function deletePreguntaFrecuente($conn, $id) {
    $sql = "DELETE FROM pregunta_frecuente WHERE id=$id";
    if ($conn->query($sql) === TRUE) {
        echo json_encode(array("message" => "Pregunta frecuente eliminada"));
    } else {
        echo json_encode(array("message" => "Error: " . $sql . "<br>" . $conn->error));
    }
}

// Ejemplos para parcela

function getParcelas($conn) {
    $sql = "SELECT * FROM parcela";
    $result = $conn->query($sql);
    $parcelas = array();
    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            $parcelas[] = $row;
        }
    }
    echo json_encode($parcelas);
}

function postParcela($conn, $data) {
    $nombre = $data['nombre'];
    $tipo = $data['tipo'];
    $lote = $data['lote'];
    $servicio = $data['servicio'];
    $descripcion = $data['descripcion'];

    $sql = "INSERT INTO parcela (nombre, tipo, lote, servicio, descripcion) VALUES ('$nombre', '$tipo', '$lote', '$servicio', '$descripcion')";
    if ($conn->query($sql) === TRUE) {
        echo json_encode(array("message" => "Parcela guardada"));
    } else {
        echo json_encode(array("message" => "Error: " . $sql . "<br>" . $conn->error));
    }
}

function updateParcela($conn, $data, $id) {
    $nombre = $data['nombre'];
    $tipo = $data['tipo'];
    $lote = $data['lote'];
    $servicio = $data['servicio'];
    $descripcion = $data['descripcion'];

    $sql = "UPDATE parcela SET nombre='$nombre', tipo='$tipo', lote='$lote', servicio='$servicio', descripcion='$descripcion' WHERE id=$id";
    if ($conn->query($sql) === TRUE) {
        echo json_encode(array("message" => "Parcela actualizada"));
    } else {
        echo json_encode(array("message" => "Error: " . $sql . "<br>" . $conn->error));
    }
}

function deleteParcela($conn, $id) {
    $sql = "DELETE FROM parcela WHERE id=$id";
    if ($conn->query($sql) === TRUE) {
        echo json_encode(array("message" => "Parcela eliminada"));
    } else {
        echo json_encode(array("message" => "Error: " . $sql . "<br>" . $conn->error));
    }
}
?>
