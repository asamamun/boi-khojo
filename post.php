<?php include 'assets/inc/header.php'; ?>
<div class="container mt-5">
    <form class="form-control p-4" action="#" method="POST">
        <div class="mb-4">
            <label for="exampleInputitem" class="form-label">Book Name</label>
            <input type="text" class="form-control" id="exampleInputitem" aria-describedby="">
        </div>
        <div class="mb-4">
            <label class="form-label" for="">Author Name</label>
            <select class="form-select " aria-label="Default select example">
                <option selected value="-1" disabled>Select</option>
                <option value="1">Rabindranath</option>
                <option value="2">John Donne</option>
                <option value="3">Shakespeare</option>
            </select>
        </div>
        <div class="mb-4">
            <label class="form-label" for="">Publications</label>
            <select class="form-select" aria-label="Default select example">
                <option selected value="-1" disabled>Select</option>
                <option value="1">Janani Publications </option>
                <option value="2">Popy Publications</option>
                <option value="3">Brother's Publications</option>
            </select>
        </div>
        <div class="mb-4">
            <label for="exampleInputitem" class="form-label">Details</label>
            <textarea name="" id="" rows="5" class="form-control"></textarea>
        </div>
        <div class="mb-4">
            <label for="exampleInputitem" class="form-label">Price</label>
            <input type="number" class="form-control" id="exampleInputitem" aria-describedby="">
        </div>
        <div class="mb-4">
            <label for="exampleInputitem" class="form-label">Discount Price</label>
            <input type="number" class="form-control" id="exampleInputitem" aria-describedby="">
        </div>
        <div class="mb-4">
            <label class="form-label" for="">Category</label>
            <select class="form-select" aria-label="Default select example">
                <option selected value="-1" disabled>Select</option>
                <option value="1">Academic</option>
                <option value="2">Job Seeker</option>
                <option value="3">Tragegy</option>
            </select>
        </div>
        <div class="mb-4">
            <label class="form-label" for="">Subcategory</label>
            <select class="form-select" aria-label="Default select example">
                <option selected value="-1" disabled>Select</option>
                <option value="1">Academic</option>
                <option value="2">Job Seeker</option>
                <option value="3">Tragegy</option>
            </select>
        </div>
        <div class="mb-4">
            <label class="form-label" for="">Division</label>
            <select class="form-select " aria-label="Default select example" id="division">
                <option selected value="-1" disabled>Select</option>

            </select>
        </div>
        <div class="mb-4">
            <label class="form-label" for="">District</label>
            <select class="form-select " aria-label="Default select example" id="district">
                <option selected value="-1" disabled>Select</option>

            </select>
        </div>
        <div class="mb-4">
            <label class="form-label" for="">Area</label>
            <select class="form-select " aria-label="Default select example" id="area">
                <option selected value="-1" disabled>Select</option>

            </select>
        </div>
        <div class="mb-4">
            <label class="form-label" for="">Condition :</label>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                <label class="form-check-label" for="inlineRadio1">Used</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                <label class="form-check-label" for="inlineRadio2">New</label>
            </div>
        </div>
        <div class="mb-4">
            <label for="formFileSm" class="form-label">Choose Image</label>
            <input class="form-control form-control-sm" id="formFileSm" type="file">
        </div>
        <div class="mb-4 form-check">
            <input type="checkbox" class="form-check-input" id="exampleCheck1">
            <label class="form-check-label" for="exampleCheck1">Check me out</label>
        </div>

        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>

<?php include 'assets/inc/footer.php'; ?>

<script>
    $(document).ready(function() {
        //for division start
        $.getJSON("assets/classes/division.php", function(data) {
            var division_opt = "";
            $.each(data, function(k, v) {
                division_opt += "<option value='" + v.id + "'>" + v.name + "</option>";
            });
            $("#division").append(division_opt);
        });
        //for division end

        //for district start
        $("#division").change(function(e) {
            var selected_division = $(this).val();
            if (selected_division == "-1") {

                return;
            }
            $.getJSON("assets/classes/district.php", {
                    division: selected_division,
                    rand: Math.random()
                },
                function(data) {
                    let district_opt = "";
                    if (data.result == "0") {
                        district_opt = "<option value='-1'>Select</option>";
                    } else {
                        district_opt = "<option value='-1'>Select</option>";
                        $.each(data.records, function(k, v) {
                            district_opt += "<option value='" + v.id + "'>" + v.name + "</option>";
                        });
                    }
                    $("#district").html(district_opt);
                });
        });
        //for disrtict end

        //for area start
        $("#district").change(function(e) {
            var selected_district = $(this).val();
            if (selected_district == "-1") {
                return;
            }
            $.getJSON("assets/classes/area.php", {
                    district: selected_district,
                    rand: Math.random()
                },
                function(data) {
                    let district_opt = "";
                    if (data.result == "0") {
                        district_opt = "<option value='-1'>Select</option>";
                    } else {
                        district_opt = "<option value='-1'>Select</option>";
                        $.each(data.records, function(k, v) {
                            district_opt += "<option value='" + v.id + "'>" + v.name + "</option>";
                        });
                    }
                    $("#area").html(district_opt);
                });
        });
        //for area end
    });
</script>
</body>

</html>