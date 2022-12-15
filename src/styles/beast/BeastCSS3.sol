// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

library BeastCSS3 {
  string internal constant PART = " color:#FFFFFF; position: relative; display:inline-block; padding:1rem;}</style><style xmlns='http://www.w3.org/2000/svg' id='polygons-fill-cols-css'>#col-h-polygons-fill-cols{ border:1px solid white; display:inline-block; background:white; color: #888888; font-size:0.66rem; margin:0.66rem;}#polygons-fill-cols-sp_0 { width: auto; padding:0.3rem; display: block; color: white; background-color:#206c8e} #polygons-fill-cols-sp_1 { width: auto; padding:0.3rem; display: block; color: white; background-color:#4cb4ca} #polygons-fill-cols-sp_2 { width: auto; padding:0.3rem; display: block; color: white; background-color:#1d1d1b} #polygons-fill-cols-sp_3 { width: auto; padding:0.3rem; display: block; color: white; background-color:#8d9baa} #polygons-fill-cols-sp_4 { width: auto; padding:0.3rem; display: block; color: white; background-color:#f2b6d3} </style><style xmlns='http://www.w3.org/2000/svg' id='paths-fill-cols-css'>#col-h-paths-fill-cols{ border:1px solid white; display:inline-block; background:white; color: #888888; font-size:0.66rem; margin:0.66rem;}#paths-fill-cols-sp_0 { width: auto; padding:0.3rem; display: block; color: white; background-color:#1ba5c4} #paths-fill-cols-sp_1 { width: auto; padding:0.3rem; display: block; color: white; background-color:#ffed69} #paths-fill-cols-sp_2 { width: auto; padding:0.3rem; display: block; color: white; background-color:#e10613} #paths-fill-cols-sp_3 { width: auto; padding:0.3rem; display: block; color: white; background-color:#f4f4f4} #paths-fill-cols-sp_4 { width: auto; padding:0.3rem; display: block; color: white; background-color:#d8d8d8} #paths-fill-cols-sp_5 { width: auto; padding:0.3rem; display: block; color: white; background-color:#221e1f} #paths-fill-cols-sp_6 { width: auto; padding:0.3rem; display: block; color: white; background-color:#fff} #paths-fill-cols-sp_7 { width: auto; padding:0.3rem; display: block; color: white; background-color:#4c598e} #paths-fill-cols-sp_8 { width: auto; padding:0.3rem; display: block; color: white; background-color:#1d1d1b} #paths-fill-cols-sp_9 { width: auto; padding:0.3rem; display: block; color: white; background-color:#f69031} #paths-fill-cols-sp_10 { width: auto; padding:0.3rem; display: block; color: white; background-color:#0f3} #paths-fill-cols-sp_11 { width: auto; padding:0.3rem; display: block; color: white; background-color:#fae676} #paths-fill-cols-sp_12 { width: auto; padding:0.3rem; display: block; color: white; background-color:#51c4d7} #paths-fill-cols-sp_13 { width: auto; padding:0.3rem; display: block; color: white; background-color:#09ff00} #paths-fill-cols-sp_14 { width: auto; padding:0.3rem; display: block; color: white; background-color:#a7976a} #paths-fill-cols-sp_15 { width: auto; padding:0.3rem; display: block; color: white; background-color:#17020b} #paths-fill-cols-sp_16 { width: auto; padding:0.3rem; display: block; color: white; background-color:#78653e} #paths-fill-cols-sp_17 { width: auto; padding:0.3rem; display: block; color: white; background-color:#8b8468} #paths-fill-cols-sp_18 { width: auto; padding:0.3rem; display: block; color: white; background-color:#bcb08f} #paths-fill-cols-sp_19 { width: auto; padding:0.3rem; display: block; color: white; background-color:#8b7f68} #paths-fill-cols-sp_20 { width: auto; padding:0.3rem; display: block; color: white; background-color:#170706} #paths-fill-cols-sp_21 { width: auto; padding:0.3rem; display: block; color: white; background-color:#a39f7b} #paths-fill-cols-sp_22 { width: auto; padding:0.3rem; display: block; color: white; background-color:#a3ecd2} #paths-fill-cols-sp_23 { width: auto; padding:0.3rem; display: block; color: white; background-color:#009440} #paths-fill-cols-sp_24 { width: auto; padding:0.3rem; display: block; color: white; background-color:#005c6d} #paths-fill-cols-sp_25 { width: auto; padding:0.3rem; display: block; color: white; background-color:#098} #paths-fill-cols-sp_26 { width: auto; padding:0.3rem; display: block; color: white; background-color:#04b4aa} </style><style xmlns='http://www.w3.org/2000/svg' id='lines-fill-cols-css'>#col-h-lines-fill-cols{ border:1px solid white; display:inline-block; background:white; color: #888888; font-size:0.66rem; margin:0.66rem;}</style><style xmlns='http://www.w3.org/2000/svg' id='ellipses-fill-cols-css'>#col-h-ellipses-fill-cols{ border:1px solid white; display:inline-block; background:white; color: #888888; font-size:0.66rem; margin:0.66rem;}#ellipses-fill-cols-sp_0 { width: auto; padding:0.3rem; display: block; color: white; background-color:#fb914a} #ellipses-fill-cols-sp_1 { width: auto; padding:0.3rem; display: block; color: white; background-color:#5a6570} #ellipses-fill-cols-sp_2 { width: auto; padding:0.3rem; display: block; color: white; background-color:#4c598e} #ellipses-fill-cols-sp_3 { width: auto; padding:0.3rem; display: block; color: white; background-color:#4cb4ca} #ellipses-fill-cols-sp_4 { width: auto; padding:0.3rem; display: block; color: white; background-color:#fae676} #ellipses-fill-cols-sp_5 { width: auto; padding:0.3rem; display: block; color: white; background-color:#fbe677} #ellipses-fill-cols-sp_6 { width: auto; padding:0.3rem; display: block; color: white; background-color:#a7976a} #ellipses-fill-cols-sp_7 { width: auto; padding:0.3rem; display: block; color: white; background-color:#005c6d} </style><style xmlns='http://www.w3.org/2000/svg' id='polygons-stroke-cols-css'>#col-h-polygons-stroke-cols{ border:1px solid white; display:inline-block; background:white; color: #888888; font-size:0.66rem; margin:0.66rem;}#polygons-stroke-cols-sp_0 { width: auto; padding:0.3rem; display: block; color: white; background-color:#1d1d1b} #polygons-stroke-cols-sp_1 { width: auto; padding:0.3rem; display: block; color: white; background-color:#30b4c3} #polygons-stroke-cols-sp_2 { width: auto; padding:0.3rem; display: block; color: white; background-color:#221e1f} #polygons-stroke-cols-sp_3 { width: auto; padding:0.3rem; display: block; color: white; background-color:#000} </style><style xmlns='http://www.w3.org/2000/svg' id='paths-stroke-cols-css'>#col-h-paths-stroke-cols{ border:1px solid white; display:inline-block; background:white; color: #888888; font-size:0.66rem; margin:0.66rem;}#paths-stroke-cols-sp_0 { width: auto; padding:0.3rem; display: block; color: white; background-color:#221e1f} #paths-stroke-cols-sp_1 { width: auto; padding:0.3rem; display: block; color: white; background-color:#9361bc} #paths-stroke-cols-sp_2 { width: auto; padding:0.3rem; display: block; color: white; background-color:#1d1d1b} #paths-stroke-cols-sp_3 { width: auto; padding:0.3rem; display: block; color: white; background-color:#171d35} #paths-stroke-cols-sp_4 { width: auto; padding:0.3rem; display: block; color: white; background-color:#fff} #paths-stroke-cols-sp_5 { width: auto; padding:0.3rem; display: block; color: white; background-color:#000} #paths-stroke-cols-sp_6 { width: auto; padding:0.3rem; display: block; color: white; background-color:#493924} #paths-stroke-cols-sp_7 { width: auto; padding:0.3rem; display: block; color: white; background-color:#a39f7b} #paths-stroke-cols-sp_8 { width: auto; padding:0.3rem; display: block; color: white; background-color:#005c6d} #paths-stroke-cols-sp_9 { width: auto; padding:0.3rem; display: block; color: white; background-color:#04b4aa} </style><style xmlns='http://www.w3.org/2000/svg' id='lines-stroke-cols-css'>#col-h-lines-stroke-cols{ border:1px solid white; display:inline-block; background:white; color: #888888; font-size:0.66rem; margin:0.66rem;}#lines-stroke-cols-sp_0 { width: auto; padding:0.3rem; display: block; color: white; background-color:#c0f0f0} #lines-stroke-cols-sp_1 { width: auto; padding:0.3rem; display: block; color: white; background-color:#fff} #lines-stroke-cols-sp_2 { width: auto; padding:0.3rem; display: block; color: white; background-color:#000} #lines-stroke-cols-sp_3 { width: auto; padding:0.3rem; display: block; color: white; background-color:#1d1d1b} </style><style xmlns='http://www.w3.org/2000/svg' id='ellipses-stroke-cols-css'>#col-h-ellipses-stroke-cols{ border:1px solid white; display:inline-block; background:white; color: #888888; font-size:0.66rem; margin:0.66rem;}#ellipses-stroke-cols-sp_0 { width: auto; padding:0.3rem; display: block; color: white; background-color:#fcd056} #ellipses-stroke-cols-sp_1 { width: auto; padding:0.3rem; display: block; color: white; background-color:#d8d8d8} #ellipses-stroke-cols-sp_2 { width: auto; padding:0.3rem; display: block; color: white; background-color:#171d35} #ellipses-stroke-cols-sp_3 { width: auto; padding:0.3rem; display: block; color: white; background-color:#000} #ellipses-stroke-cols-sp_4 { width: auto; padding:0.3rem; display: block; color: white; background-color:#1d1d1b} #ellipses-stroke-cols-sp_5 { width: auto; padding:0.3rem; display: block; color: white; background-color:#493924} </style><style xmlns='http://www.w3.org/2000/svg' id='frag-but-css'>#frag-but { border: 1px solid black; z-index:1000; position: fixed; right:150px; top:0; background: black; color:white; padding:0.66rem; margin:0; pointer-events:all; user-select:none; cursor:pointer}#frag-but:hover { background: rgb(255, 105, 180); color:white;}; #fra-holder { position: fixed; display:inline-block; right:0px; top:80px; border: 0px solid white; z-index:2000; background: rgba(0,0,0,0.25)} #fra-output { padding:0.55rem; background: rgba(0,0,0,0.75); font-size: 1rem; position: fixed; display:inline-block; right:0px; top:80px; color: #FFFFFF} #fra-out-button { padding:0.55rem; background: rgba(0,0,0,0.75); font-size: 1.5rem; display:inline-block; right:0px; top:80px; color: #00FF00} #rotate-frag-b { margin:1px; padding: 0.25rem; font-size: 1rem; border-radius:0.25rem; color: white;background: rgb(255, 105, 180); text-decoration: none;} #rotate-frag-b:hover{ color: black;background: white; text-decoration: none;}</style><style xmlns='http://www.w3.org/2000/svg' id='css-but-css'>#css-but { border: 1px solid black; z-index:1000; position: fixed; right:77px; top:0; background: black; color:white; padding:0.66rem; margin:0; pointer-events:all; user-select:none; cursor:pointer}#css-but:hover { background: rgb(255, 105, 180); color:white;}; #fra-css-holder { position: fixed; display:inline-block; right:0px; top:180px; border: 4px solid white; z-index:2000; background: rgba(0,0,0,0.25)} #fra-css-output { padding:1rem; background: rgba(0,0,0,0.75); font-size: 1rem; position: fixed; display:inline-block; left:0px; top:80px; color: #FFFFFF;} #fra-css-out-button { padding:0.55rem; background: rgba(0,0,0,0.75); font-size: 1.5rem; display:inline-block; right:0px; top:80px; color: #00FF00} #rotate-css-b { margin:1px; padding: 0.25rem; font-size: 1rem; border-radius:0.25rem; color: white;background: rgb(255, 105, 180); text-decoration: none;} #rotate-css-b:hover{ color: black;background: white; text-decoration: none;}</style><style xmlns='http://www.w3.org/2000/svg' id='filters-ui-css-holder'> #filters-ui-holder { display:inline-block; left:0px; top:80px; border: 0px solid white; z-index:2000; background: rgba(0,0,0,0.25)}</style><style xmlns='http://www.w3.org/2000/svg' id='new-css'>body {background-color: none; font-family: sans-serif; font-size:0.66rem; letter-spacing: 2px; text-shadow: rgba(0,0,0,0.7) 0.5px 0.5px 0.5px;}a {margin:1px; padding: 0.25rem; font-size: 1rem; border-radius:0.25rem; color: white; background: rgb(255, 105, 180); text-decoration: none; user-select:none; z-index:1300} a:hover{ color: black;background: white; text-decoration: none;} table {background-color: white; color: black; }th {} table, th, td {border: 0px solid; border-bottom: 1px solid grey; padding: 0.66rem; margin: 0rem; }#closeWorksButton {position: absolute; top: 0.66rem; right: 0.66rem; pointer-events: all; cursor: pointer; }#works-holder {display: block; position: absolute; width: 100%; } #works-table {display: block; position: relative; margin: 0 auto; max-width: 1024px; } .btn-close {box-sizing: content-box; width: 1em; height: 1em; padding: 0.25em 0.25em; color: #000; background: transparent url('data:image/svg+xml,%3csvg xmlns=%27http://www.w3.org/2000/svg%27 viewBox=%270 0 16 16%27 fill=%27%23000%27%3e%3cpath d=%27M.293.293a1 1 0 0 1 1.414 0L8 6.586 14.293.293a1 1 0 1 1 1.414 1.414L9.414 8l6.293 6.293a1 1 0 0 1-1.414 1.414L8 9.414l-6.293 6.293a1 1 0 0 1-1.414-1.414L6.586 8 .293 1.707a1 1 0 0 1 0-1.414z%27/%3e%3c/svg%3e') center/1em auto no-repeat; border: 0; border-radius: 0.375rem; opacity: 0.5; } #mysvg {border: none; height: 90%; margin: 0 auto; padding-top: 1.5rem; }label {padding: 0.26rem; display: block; color: white; } #svg-holder {display: block; position: absolute; width: 100%; height: 100%; text-align: center; } option {font-weight: normal; display: block; white-space: nowrap; min-height: 1.2em; padding: 0px 2px 1px; } #drop-list { position: absolute; background: rgba(0,0,0,0.75); left: 0; top: 40px; z-index: 10000; pointer-events: all; display: inline-block }#randB { position: absolute; top: 0; right: 255px; border: 1px solid black; padding: 0.66rem; background: rgb(255, 105, 180); color: white; user-select: none; cursor: pointer } #randB:hover { background: white; color: rgb(255, 105, 180); box-shadow: 0px 2px 12px -4px rgba(0,0,0,0.8); pointer-events:all; z-index:9999999} #overlay-works { display: inline-block } #fps_stat { position: fixed; top: 0px; left: 1px; color: white; background: black; padding: 0.66rem; width: 70px; text-align: center; border: 1px solid black;} .paused{-webkit-animation-play-state:paused; -moz-animation-play-state:paused; -o-animation-play-state:paused; animation-play-state:paused; }.shake_button {animation: shake 0.82s cubic-bezier(.36, .07, .19, .97) both infinite; transform: translate3d(0, 0, 0); backface-visibility: hidden; perspective: 1000px; }@keyframes shake {10%, 90% {transform: translate3d(-1px, 0, 0); } 20%, 80% {transform: translate3d(2px, 0, 0); } 30%, 50%, 70% {transform: translate3d(-4px, 0, 0); } 40%, 60% {transform: translate3d(4px, 0, 0); } }</style><style xmlns='http://www.w3.org/2000/svg' id='anim-css'>#anim-holder { position: fixed; left: 110px; top: 12px;} #anim-play-b { position:relative; border: 1px solid black; padding: 0.66rem; color:black; cursor: pointer; margin:1px; } #anim-play-b:hover {background-color: black; color:white; pointer-events:all; z-index:10000; user-select: none; box-shadow: 0px 2px 12px -4px rgba(0,0,0,0.8);}#anim-stop-b { position: relative; border: 1px solid black; padding: 0.55rem; color:black; cursor: pointer; margin:1px;} #anim-stop-b:hover {background-color: black; color:white; pointer-events:all; z-index:10000; user-select:none; box-shadow: 0px 2px 12px -4px rgba(0,0,0,0.8);}#anim-dir-b { position:relative; border: 1px solid black; padding: 0.66rem; color:black; cursor: pointer; margin:1px; } #anim-dir-b:hover {background-color: black; color:white; pointer-events:all; z-index:10000; user-select: none; box-shadow: 0px 2px 12px -4px rgba(0,0,0,0.8);}#anim_time { position: relative; border: 1px solid black; padding: 0.66rem; color:black; margin:1px; }";

  function getPart() external pure returns (string memory) {
    return PART;
  }
}