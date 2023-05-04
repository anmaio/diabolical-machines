// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

library SoundImp3 {

  string internal constant PART = "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';function init(w){const B=new(window.AudioContext||window.webkitAudioContext);var A=function(A){var Q=atob(A),E=Q.length,A=new ArrayBuffer(E),w=new Uint8Array(A);for(let A=0;A<E;A++)w[A]=Q.charCodeAt(A);return A}(reverbData);B.decodeAudioData(A,A=>{var Q=B.createConvolver(),A=(Q.buffer=A,B.createGain()),E=(A.gain.value=.2,B.createOscillator());E.frequency.value=100,E.connect(A),(w?(A.connect(Q),Q):A).connect(B.destination),E.start(),E.stop(B.currentTime+1)})}function playAudio(A){init(A)}document.addEventListener('keydown',function(A){!A.shiftKey||'a'!==A.key&&65!==A.keyCode?'a'!==A.key&&65!==A.keyCode||playAudio(!1):playAudio(!0)});]]></script>";

  function getPart() external pure returns (string memory) {
    return PART;
  }
  
}