<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exam Result Rectifier - Teacher Dashboard</title>
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


<?php

$conn = new mysqli('127.0.0.1', 'root', '', 'examination_rectifier');
if ($conn->connect_error) {
    die('Connection Failed :' . $conn->connect_error);
}
else{
    $result = $conn->query("SELECT * FROM problemsubmissions");
    }
    

// Display data in an HTML table
if ($result -> num_rows > 0) {
    echo "<h2>Open Issues</h2>";
    echo "<table border='1'>";
    echo "<tr><th>Submission ID</th><th>Student ID</th><th>Problem Description</th><th>Submission Date</th><th>Status</th></tr>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $row["SubmissionID"] . "</td>";
		echo "<td>" . $row["StudentID"] . "</td>";
        echo "<td>" . $row["ProblemDescription"] . "</td>";
        echo "<td>" . $row["Status"] . "</td>";
        echo "<td>" . $row["ExamID"] . "</td>";
        echo "</tr>";
    }
    echo "</table>";
} else {
    echo "No data available.";
}

$conn->close();
?>
</body>
<!-- <body>
    <header>
        <h1>Exam Result Rectifier</h1>
        <nav>
            <ul>
                <li><a href="#">Dashboard</a></li>
                <li><a href="#">Account</a></li>
                <li><a href="#">Logout</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <h2>Open Issues</h2>
        <table id="issuesTable">
            <thead>
                <tr>
                    <th>Submission ID</th>
                    <th>Student Name</th>
                    <th>Problem Description</th>
                    <th>Submission Date</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <!-- Issues will be dynamically added here using JavaScript -->
            </tbody>
        </table>
    </main>

    <!-- <script src="script.js"></script>
    <script>
        // Example JavaScript to fetch and display issues (replace with actual logic)
        document.addEventListener("DOMContentLoaded", function() {
            // Fetch issues from the server (replace this URL with your API endpoint)
            fetch('api/teacher/issues')
                .then(response => response.json())
                .then(data => displayIssues(data));
        });

        function displayIssues(issues) {
            const issuesTableBody = document.querySelector('#issuesTable tbody');

            // Clear existing rows
            issuesTableBody.innerHTML = '';

            // Loop through issues and append rows to the table
            issues.forEach(issue => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${issue.SubmissionID}</td>
                    <td>${issue.StudentName}</td>
                    <td>${issue.ProblemDescription}</td>
                    <td>${issue.SubmissionDate}</td>
                    <td>${issue.Status}</td>
                `;
                issuesTableBody.appendChild(row);
            });
        }
    </script> 
</body> -->
</html>
