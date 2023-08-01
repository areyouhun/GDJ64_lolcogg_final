<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/top.jsp"/>
<!-- Your own style tag or CSS file -->
<style>
	body{
		overflow: hidden;
	}
	
	/* .load{
		width:100%;
		height:100%;
		background-color:var(--lol-black);
		animation-duration: 3s;
 		animation-name: slidein;
 		z-index:10000;
 		position: absolute;
 		display: flex;
 		align-items: center;
    	justify-content: center;
    	animation-fill-mode: forwards;
	}
	@keyframes slidein {
		0%{
		    margin-left: -100%;
			width: 100%;
			opacity: 0;
	 	}
	
		50%{
		    margin-left: 0%;
		    width: 100%;
		    opacity:1;
		}
		100%{
		    margin-left: 100%;
			width: 100%;
			opacity: 0;
			display:none;
	 	}

	} */
	
	a {
				color: #8ff;
			}

			#menu {
				position: absolute;
				bottom: 20px;
				width: 100%;
				text-align: center;
			}

			.element {
				width: 210px;
				height: 320px;
				box-shadow: 0px 0px 12px rgba(0,255,255,0.5);
				border: 1px solid var(--lol-mainblue);
				font-family: Helvetica, sans-serif;
				text-align: center;
				line-height: normal;
				cursor: default;
				
			}
			

			.element:hover {
				box-shadow: 0px 0px 12px rgba(0,255,255,0.75);
				border: 1px solid var(--lol-teamblue);
			}

				/* .element .number {
					position: absolute;
					top: 20px;
					right: 20px;
					font-size: 12px;
					color: rgba(127,255,255,0.75);
				}

				.element .symbol {
					position: absolute;
					top: 40px;
					left: 0px;
					right: 0px;
					font-size: 60px;
					font-weight: bold;
					color: rgba(255,255,255,0.75);
					text-shadow: 0 0 10px rgba(0,255,255,0.95);
				}

				.element .details {
					position: absolute;
					bottom: 15px;
					left: 0px;
					right: 0px;
					font-size: 12px;
					color: rgba(127,255,255,0.75);
				} */

			button {
				color: rgba(127,255,255,0.75);
				background: transparent;
				outline: 1px solid rgba(127,255,255,0.75);
				border: 0px;
				padding: 5px 10px;
				cursor: pointer;
			}

			button:hover {
				background-color: rgba(0,255,255,0.5);
			}

			button:active {
				color: #000000;
				background-color: rgba(0,255,255,0.75);
			}
			#back {
				position: absolute;
				width: 100%;
				height: 100%;
				-webkit-user-drag: none;
			}
			#text{
				color: black;
				position: absolute;
			}

	
</style>
<!------------------------------------>
<title>포인트 상점</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="navBgColor" value="nav-black"/>
</jsp:include>
    <section>
    <%-- <div class="load">
    	<img src="${path}/resources/images/common/header_logo.png" >
    </div> --%>

	    <div id="container"></div>
		<div id="menu">
			<button id="table">TABLE</button>
			<button id="reset">위치 초기화</button>
		</div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="${path}/resources/js/jquery-3.7.0.min.js"></script>
<script src="${path}/resources/js/script_common.js"></script>
<!-- Your own script tag or JavaScript file -->
<script async src="https://unpkg.com/es-module-shims@1.6.3/dist/es-module-shims.js"></script>

<script type="importmap">
	{
		"imports": {
			"three": "https://unpkg.com/three@0.155.0/build/three.module.js",
			
			"three/addons/": "${path}/resources/js/3d/"
		}
	}
</script>

<script type="module">
			
			import * as THREE from 'three';

			import TWEEN from 'three/addons/tween.module.js';
			import { TrackballControls } from 'three/addons/TrackballControls.js';
			import { CSS3DRenderer, CSS3DObject } from 'three/addons/CSS3DRenderer.js';

			const table = [
			<c:if test="${not empty pack}">
				<c:forEach var="p" items="${pack }">
				<c:set var="i" value="${i+1}"/>
					'${p.emoName}',${i}, 1,
				</c:forEach>
			</c:if>
			];

			let camera, scene, renderer;
			let controls;

			const objects = [];
			const targets = { table: []};

			init();
			animate();

			function init() {

				camera = new THREE.PerspectiveCamera( 40, window.innerWidth / window.innerHeight, 1, 10000 );
				camera.position.z = 2200;

				scene = new THREE.Scene();

				// table

				for ( let i = 0; i < table.length; i += 3 ) {

					const element = document.createElement( 'div' );
					element.className = 'element';


					const img = document.createElement( 'img' );
					img.setAttribute("src", "${path}/resources/images/emoticon/"+table[ i ]+".png");
					img.setAttribute("width", "200");
					img.setAttribute("height", "318");
					element.appendChild( img );


					const objectCSS = new CSS3DObject( element );
					objectCSS.position.x = Math.random() * 4000 - 2000;
					objectCSS.position.y = Math.random() * 4000 - 2000;
					objectCSS.position.z = Math.random() * 4000 - 2000;
					scene.add( objectCSS );

					objects.push( objectCSS );


					const object = new THREE.Object3D();
					object.position.x = ( table[ i + 1 ] * 240 ) - 1320;
					object.position.y = - ( table[ i + 2 ] * 180 ) + 190;

					targets.table.push( object );
				}


				

				renderer = new CSS3DRenderer();
				renderer.setSize( window.innerWidth, window.innerHeight );
				document.getElementById( 'container' ).appendChild( renderer.domElement );

				//

				controls = new TrackballControls( camera, renderer.domElement );
				controls.minDistance = 300;
				controls.maxDistance = 10000;
				controls.addEventListener( 'change', render );

				const buttonTable = document.getElementById( 'table' );
				buttonTable.addEventListener( 'click', function () {

					transform( targets.table, 2000 );

				} );


				transform( targets.table, 2000 );

				//

				window.addEventListener( 'resize', onWindowResize );

				const buttonreset = document.getElementById( 'reset' );
				buttonreset.addEventListener( 'click', function () {
					camera = new THREE.PerspectiveCamera( 40, window.innerWidth / window.innerHeight, 1, 10000 );
					camera.position.z = 2200;
					controls = new TrackballControls( camera, renderer.domElement );
					controls.minDistance = 300;
					controls.maxDistance = 10000;
					controls.addEventListener( 'change', render );

				} );

			}

			function transform( targets, duration ) {

				TWEEN.removeAll();

				for ( let i = 0; i < objects.length; i ++ ) {

					const object = objects[ i ];
					const target = targets[ i ];

					new TWEEN.Tween( object.position )
						.to( { x: target.position.x, y: target.position.y, z: target.position.z }, Math.random() * duration + duration )
						.easing( TWEEN.Easing.Exponential.InOut )
						.start();

					new TWEEN.Tween( object.rotation )
						.to( { x: target.rotation.x, y: target.rotation.y, z: target.rotation.z }, Math.random() * duration + duration )
						.easing( TWEEN.Easing.Exponential.InOut )
						.start();

				}

				new TWEEN.Tween( this )
					.to( {}, duration * 2 )
					.onUpdate( render )
					.start();

			}

			function onWindowResize() {

				camera.aspect = window.innerWidth / window.innerHeight;
				camera.updateProjectionMatrix();

				renderer.setSize( window.innerWidth, window.innerHeight );

				render();

			}

			function animate() {

				requestAnimationFrame( animate );

				TWEEN.update();

				controls.update();

			}

			function render() {

				renderer.render( scene, camera );

			}

			

</script>

<!-------------------------------------------->
</body>
</html>
