<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Drag</title>
	<meta charset="utf-8">

	<style type="text/css">
		#flower-list {
			float: left;
			width: 150px;
			height: 500px;
			border: 3px solid green;
			text-align: center;
		}

		#flower-box {
			margin: 0 10px 0 10px;
			float: left;

			width: 500px;
			height: 500px;
			border: 3px solid brown;
		}

		.flower {
			width: 100px;
			height: 100px;
		}
	</style>
</head>
<body>
<!-- 꽃 목록 -->
<div id="flower-list">
</div>

<!-- 꽃을 배치할 박스 -->
<div id="flower-box">
</div>

<div id="flower-list-text"></div>
<div id="flower-price-text"></div>

<input id="color-picker" type="color">

<script>
	// 꽃을 배치할 박스를 불러옴
	const flowerBox = document.getElementById("flower-box");

	// 클릭한 꽃을 저장할 변수
	let clickedFlower;
	let clickedOffsetX;
	let clickedOffsetY;

	// 꽃 목록에 꽃 추가
	addFlower("img/flower_1.png", "꽃1", 1000);
	addFlower("img/flower_2.png", "꽃2", 1100);
	addFlower("img/flower_3.png", "꽃3", 1110);

	// 마우스를 움직이면
	document.addEventListener("mousemove", function(event) {
		// 클릭한 꽃이 있을 경우
		if (clickedFlower != undefined) {
			// 클릭한 꽃을 마우스 위치로 이동
			clickedFlower.style.top = (event.pageY - clickedOffsetY) + "px";
			clickedFlower.style.left = (event.pageX - clickedOffsetX) + "px";
		}
	});

	// 마우스를 떼면
	document.addEventListener("mouseup", function(event) {
		// 마우스를 더 이상 따라다니지 않도록 꽃을 변수에서 삭제
		clickedFlower = undefined;
	})

	// 꽃 목록에 꽃을 추가하는 함수
	function addFlower(imagePath, name, price) {
		// img 태그 생성 및 설정
		let newFlower = document.createElement("img");
		newFlower.src = imagePath;
		newFlower.className = "flower";
		newFlower.draggable = false;
		newFlower.name = name;
		newFlower.price = price;

		// 목록에 있는 꽃을 클릭할 경우
		newFlower.addEventListener("mousedown", function(event) {
			// 클릭한 꽃을 복사해서 마우스를 따라다닐 꽃 변수에 저장
			clickedFlower = this.cloneNode(true);
			clickedFlower.className = "flower flower-copy";
			clickedFlower.name = name;
			clickedFlower.price = price;

			// body에 복사본 추가
			document.getElementById("flower-box").appendChild(clickedFlower);

			// 복사한 꽃을 클릭하면 꽃을 마우스에 따라다니도록 이벤트 추가 (복사한 꽃도 움직일 수 있게 하기위해)
			clickedFlower.addEventListener("mousedown", function(event) {
				holdFlower(this, event);
			});
			// 복사한 꽃에서 마우스를 떼면 그 자리에 배치되도록 이벤트 추가 (복사한 꽃도 배치할 수 있게 하기위해)
			clickedFlower.addEventListener("mouseup", function(event) {
				placeFlower(event);
			});

			// 복사한 꽃을 지금 당장 마우스에 따라다니도록 설정
			holdFlower(clickedFlower, event);
		});

		// 꽃 목록에 꽃 추가
		document.getElementById("flower-list").appendChild(newFlower);
	}

	function holdFlower(flowerElement, event) {
		// 클릭한 꽃에 넘겨받은 꽃 element 저장
		clickedFlower = flowerElement;

		// 꽃의 어느 지점을 클릭했는지 저장
		clickedOffsetX = event.offsetX;
		clickedOffsetY = event.offsetY;

		// 꽃을 아무데나 배치할 수 있도록 설정
		clickedFlower.style.position = "absolute";

		// 꽃을 마우스 위치로 이동
		clickedFlower.style.top = event.pageY - clickedOffsetY + "px";
		clickedFlower.style.left = event.pageX - clickedOffsetX + "px";
	}

	function placeFlower(event) {
		// 클릭한 꽃이 꽃 박스 밖에 있으면
		if (!checkInBox(clickedFlower, flowerBox)) {
			// 클릭한 꽃을 삭제
			document.getElementById("flower-box").removeChild(clickedFlower);
		}
		
		/* document.getElementById("flower-list-text").innerHTML += clickedFlower.name + " ";
		let priceText = document.getElementById("flower-price-text").innerHTML;
		let price = priceText.length < 1 ? 0 : parseInt(priceText);
		document.getElementById("flower-price-text").innerHTML = price + clickedFlower.price; */
		
		
		if (flowerBox.hasChildNodes()) {
			let listText = "";
			let price = 0;
			
			let flowers = flowerBox.childNodes;
			for (let i = 0; i < flowers.length; i++) {
				if (flowers[i].name == undefined) continue;
				listText += listText.length < 1 ? (flowers[i].name + "(" + flowers[i].price + "원)") : ", " + (flowers[i].name + "(" + flowers[i].price + "원)");
				price += flowers[i].price;
			}
			
			document.getElementById("flower-list-text").innerHTML = listText;
			document.getElementById("flower-price-text").innerHTML = price + "원";
		}
		
		// 마우스를 더 이상 따라다니지 않도록 꽃을 변수에서 삭제
		clickedFlower = undefined;
	}

	// 꽃이 박스 안에 있으면 true 없으면 false 반환하는 함수
	function checkInBox(flowerElement, boxElement) {
		// 꽃의 상하좌우 위치 저장
		let flowerLeft = window.pageXOffset + flowerElement.getBoundingClientRect().left;
		let flowerRight = window.pageXOffset + flowerElement.getBoundingClientRect().right;
		let flowerTop = window.pageYOffset + flowerElement.getBoundingClientRect().top;
		let flowerBottom = window.pageYOffset + flowerElement.getBoundingClientRect().bottom;

		// 박스의 상하좌우 위치 저장
		let boxLeft = window.pageXOffset + boxElement.getBoundingClientRect().left;
		let boxRight = window.pageXOffset + boxElement.getBoundingClientRect().right;
		let boxTop = window.pageYOffset + boxElement.getBoundingClientRect().top;
		let boxBottom = window.pageYOffset + boxElement.getBoundingClientRect().bottom;

		// 꽃이 박스 안에 있는지 계산해서 안이면 true 밖이면 false 반환
		return boxLeft < flowerLeft && flowerRight < boxRight && boxTop < flowerTop && flowerBottom < boxBottom;
	}

	document.getElementById("color-picker").addEventListener("change", function () {
		document.getElementById('flower-box').style.border = "3px solid " + this.value;
	});
</script>
</body>
</html>