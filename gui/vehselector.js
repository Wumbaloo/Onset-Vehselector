let vehicles = [
	{ id: 1, name: "Sedan", img: "Sedan.jpg" },
	{ id: 2, name: "Sedan Taxi", img: "SedanTaxi.jpg" },
	{ id: 3, name: "Sedan Police", img: "SedanPolice.jpg" },
	{ id: 4, name: "Sedan 2", img: "Sedan2.jpg" },
	{ id: 5, name: "Sedan 3", img: "Sedan3.jpg" },
	{ id: 6, name: "Nascar", img: "Nascar.jpg" },
	{ id: 7, name: "Truck", img: "Truck.jpg" },
	{ id: 8, name: "Ambulance", img: "Ambulance.jpg" },
	{ id: 9, name: "Garbage Truck", img: "GarbageTruck.jpg" },
	{ id: 10, name: "Helicopter", img: "Helicopter.jpg" },
	{ id: 11, name: "Coupe", img: "Coupe.jpg" },
	{ id: 12, name: "Rally", img: "Rally.jpg" },
	{ id: 13, name: "Heavy Black", img: "HeavyBlack.jpg" },
	{ id: 14, name: "Heavy Tactical", img: "HeavyTactical.jpg" },
	{ id: 15, name: "Heavy Rescue", img: "HeavyRescue.jpg" },
	{ id: 16, name: "Heavy Desert", img: "HeavyDesert.jpg" },
	{ id: 17, name: "Cargo Truck", img: "CargoTruck.jpg" },
	{ id: 18, name: "Cargo Truck 1", img: "CargoTruck1.jpg" },
	{ id: 19, name: "Sedan One Color", img: "SedanOneColor.jpg" },
	{ id: 20, name: "Helicopter One Color", img: "HelicopterOneColor.jpg" },
	{ id: 21, name: "Military", img: "Military01.jpg" },
	{ id: 22, name: "Light Cargo", img: "LightCargo01.jpg" },
	{ id: 23, name: "Light Cargo 2", img: "LightCargo02.jpg" },
	{ id: 24, name: "Armored Truck", img: "ArmoredTruck.png" },
	{ id: 25, name: "Sedan Classic", img: "SedanClassic.png" }
]

let drawed = false;

function AddVehicles() {
	if (drawed)
		return
	drawed = true
	vehicles.forEach(veh => {
		let vehicle = "<div class='card' id=" + veh.id + "><img src='http://asset/vehselector/gui/images/" + veh.img + "' alt='" + veh.name + "' class='img-card' contain>";
		vehicle += "<div class='container'><h3><b>" + veh.name + "</b></h3></div></div>";
		$('#vehtable').append(vehicle);
	});
	$('.card img').click((e) => {
		CallEvent("SelectVehicle", e.target.closest('.card').id);
	});
	$('.card h3').click((e) => {
		CallEvent("SelectVehicle", e.target.closest('.card').id);
	});
	$('.card').click((e) => {
		if (e.target && e.target.id)
			CallEvent("SelectVehicle", e.target.id);
	});
	$('.cross').click((e) => {
		if (e.target)
			CallEvent("CloseBrowser");
	});
	$(document).ready(function () {
		$("#searchVehicle").on("keyup", function () {
			var value = $(this).val().toLowerCase();
			$("#vehtable *").filter(function () {
				$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
			});
		});
	});
}

function SearchVehicle() {
	let search = $('#searchVehicle').val().toLowerCase();

	$("#vehtable *").filter(function () {
		$(this).toggle($(this).text().toLowerCase().indexOf(search) > -1)
	});

}