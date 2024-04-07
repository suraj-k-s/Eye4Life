<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Donor and Recipient List</title>
<style>
    #donor-container {
        width: 300px;
        height: 200px;
        border: 1px solid #ccc;
        overflow: hidden;
        position: relative;
    }

    .donor-list {
        width: 100%;
        height: 100%;
        overflow: hidden;
    }

    .donor-item {
        padding: 10px;
        border-bottom: 1px solid #ccc;
        display: none;
    }

    .active {
        display: block;
    }

    .btn-container {
        margin-top: 10px;
        text-align: center;
    }

    .btn-container button {
        padding: 5px 10px;
        cursor: pointer;
    }
</style>
</head>
<body>

<div id="donor-container">
    <div class="donor-list" id="donor-list">
        <!-- Donor items will be loaded here -->
    </div>
    <div class="btn-container">
        <button onclick="previousDonor()">Previous</button>
        <button onclick="nextDonor()">Next</button>
    </div>
</div>

<div id="recipient">
    <!-- Recipient list will be loaded here -->
</div>

<script>
    var currentDonorIndex = 0;
    var donorData = [
        "Donor 1",
        "Donor 2",
        "Donor 3",
        "Donor 4",
        "Donor 5"
    ];

    function showDonor() {
        var donorItems = document.getElementsByClassName("donor-item");
        for (var i = 0; i < donorItems.length; i++) {
            donorItems[i].classList.remove("active");
        }
        donorItems[currentDonorIndex].classList.add("active");
    }

    function loadDonorList() {
        var donorList = document.getElementById("donor-list");
        donorList.innerHTML = "";

        donorData.forEach(function (donor) {
            var donorItem = document.createElement("div");
            donorItem.className = "donor-item";
            donorItem.textContent = donor;
            donorList.appendChild(donorItem);
        });

        showDonor();
    }

    function previousDonor() {
        if (currentDonorIndex > 0) {
            currentDonorIndex--;
            showDonor();
        }
    }

    function nextDonor() {
        if (currentDonorIndex < donorData.length - 1) {
            currentDonorIndex++;
            showDonor();
        }
    }

    loadDonorList();
</script>

</body>
</html>
