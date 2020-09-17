const qrCode = window.qrcode;

const video = document.createElement("video");
const canvas = document.getElementById("qr-canvas");
const ctx = canvas.getContext("2d");

var scanning = false;
start();

// Redirects to the product page after successful scan
qrCode.callback = function(res) {
	if (res) {
		if(res.startsWith('https://qr-konsum/product')) {
			scanning = false;
			video.srcObject.getTracks().forEach(track => {
				track.stop();
			});
			window.location = res;
		}
		else {
			scanning = true;
			var info = document.getElementsByClassName("info")[0]
			info.innerText = "Ungültiger QR-Code!";
			
			setTimeot(function() {
				info.innerText = "Scanne den QR-Code eines Preisschildes!";
			}, 2000);
		}
	}
};

// Starts the camera and video stream
function start() {
	canvas.width = window.innerWidth;
	canvas.height = 0.7 * window.innerHeight;
	canvas.style.height = canvas.height;
	
	if(!navigator.mediaDevices.getUserMedia) {
		errCallback( {
			name: 'NotFoundError',
			message: 'User media stream not supported!'
		});
	}
	navigator.mediaDevices
		.getUserMedia({ video: { facingMode: "environment" } })
		.then(function(stream) {
			scanning = true;
			video.setAttribute("playsinline", true);
			video.srcObject = stream;
			video.play();
			tick();
			scan();
	}, errCallback);
};

// Handles media request errors
function errCallback() {
	var info = document.getElementsByClassName("info")[0]
	info.innerText = "Keine Kamera Verfügbar!";
	console.log(err);
}

// Draws the camera video frames
function tick() {
	canvas.height = video.videoHeight;
	canvas.width = video.videoWidth;
	ctx.drawImage(video, 0, 0, canvas.width, canvas.height);

	scanning && requestAnimationFrame(tick);
}

// Tries scanning the QR code
function scan() {
	try {
		qrCode.decode();
	} catch (e) {
		setTimeout(scan, 300);
	}
}
