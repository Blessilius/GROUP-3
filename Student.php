<?php
$conn = new mysqli('127.0.0.1', 'root', '', 'examination_rectifier');
if ($conn->connect_error) {
    die('Connection Failed: ' . $conn->connect_error);
}

// Function to get Department radio buttons
function getDepartmentsRadio($conn) {
    $sql = "SELECT DepartmentName FROM department";
    $result = $conn->query($sql);

    if (!$result) {
        die("Error retrieving departments: " . $conn->error);
    }

    while ($row = $result->fetch_assoc()) {
        echo "<input type='radio' name='department' value='" ."<br>". $row['DepartmentName'] . "'>" . $row['DepartmentName']  ;
    }
   
}

// Function to get Module radio buttons
function getModules($conn) {
    $sql = "SELECT * FROM modules";
    $result = $conn->query($sql);

    if (!$result) {
        die("Error retrieving modules: " . $conn->error);
    }
    $drop = "<select name='module'>";
    while ($row = $result->fetch_assoc()) {
        //echo "<input type='radio' name='module' value='" . $row['ModuleName'] . "'>" . $row['ModuleName'] . "<br>";
        $val = $row['ModuleName'];
        $drop = $drop . "<option id='$val'>$val</option>";
    }
    $drop = $drop . "</select>";
    echo $drop;
}

function getTeachers($conn) {
    $sql = "SELECT * FROM teachers";
    $result = $conn->query($sql);

    if (!$result) {
        die("Error retrieving modules: " . $conn->error);
    }
    $drop = "<select name='teacher'>";
    while ($row = $result->fetch_assoc()) {
        $val = $row['TeacherName'];
        $drop = $drop . "<option id='$val'>$val</option>";
    }
    $drop = $drop . "</select>";
    echo $drop;
}

// Function to get Teacher radio buttons
// function getTeachersRadio($conn) {
//     $sql = "SELECT * FROM teachers";
//     $result = $conn->query($sql);

//     if (!$result) {
//         die("Error retrieving teachers: " . $conn->error);
//     }

//     while ($row = $result->fetch_assoc()) {
//         echo "<input type='radio' name='teacher' value='" . $row['TeacherName'] . "'>" . $row['TeacherName'] . "<br>";
//     }
   
// }

// HTML Form and Issue Submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
 
    $module = $_POST['module'];
    $teacher = $_POST['teacher'];
    $description = $_POST['description'];

    $submissionDate = date('Y-m-d H:i:s'); // Current date and time

    // Insert data into the problemsubmissions table
    $insertSubmissionQuery = $conn->prepare("INSERT INTO problemsubmissions (ProblemDescription, SubmissionDate) VALUES (?, ?)");
    $insertSubmissionQuery->bind_param("ss", $description, $submissionDate);

    if ($insertSubmissionQuery->execute()) {
        echo "Submission successful!";
    } else {
        echo "Error: " . $insertSubmissionQuery->error;
    }

    $insertSubmissionQuery->close();
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exam Result Rectifier - Student Dashboard</title>
   <style>
        /* Add any additional styling specific to the teacher dashboard here */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }
        header {
            background-color: #f0f0f0;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
                }
         nav ul {
            list-style: none;
            margin: 0;
            padding: 0;
        }

nav li {
    display: inline-block;
    margin-right: 20px;
}

a {
    text-decoration: none;
    color: #333;
}
label {
   margin-bottom: 8px;
}
input {
    padding: 8px;
    margin-bottom: 16px;
    box-sizing: border-box;
}
button {
    background-color: #4caf50;
    color: white;
    padding: 10px 15px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
    </style>
</head>
<body>
    <header>
        <h1>Exam Result Rectifier</h1>
        <nav>
            <ul>
                <li><a href="#">Dashboard</a></li>
                <li><a href="#">Submit Issue</a></li>
                <li><a href="#">Account</a></li>
                <li><a href="index.html">Logout</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <h2>Submit Issue</h2>
        <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">

            
            <label><b>Departments:</b></label>
            <?php getDepartmentsRadio($conn); ?>
            <br>

            
            <label>Modules:</label>
            <?php getModules($conn); ?>
            <br>

            
            <label>Teachers:</label>
            <?php getTeachers($conn); ?>
            <br>

            <label>Description:</label>
            <textarea name="description" rows="4" cols="50" required></textarea>
            <br>
            
            <input type="submit" value="Submit">
        </form>
    </main>

    <script src="script.js"></script>
</body>
</html>

<?php
$conn->close();
?>