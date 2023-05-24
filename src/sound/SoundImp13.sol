// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

library SoundImp13 {

  string internal constant PART = "A).connect(masterGain).connect(bandpassFilter).connect(analyser).connect(audioContext.destination),a.connect(e).connect(masterGain).connect(bandpassFilter).connect(analyser).connect(audioContext.destination),o.start(),o.onended=function(){1==app.audio&&0==holdOnSoundEvents&&console.log(\"encounterSound - onended\")},setTimeout(()=>{a.gain.linearRampToValueAtTime(0,audioContext.currentTime+2),console.log(\"encounterSound, setTimeout\")},t),app.audioContexts.push({id:\"encounters\",ctx:audioContext,osc:o})}async function playAngel(e=5,q=400){console.log(\"playAngel\",e,q);const t=[];var o=[];var A=await getImpulseBuffer(audioContext,reverbData),a=audioContext.createConvolver();a.buffer=A;for(let A=0;A<4;A++)t[A]=audioContext.createOscillator(),o[A]=audioContext.createGain(),t[A].type=\"sine\",t[A].frequency.value=q*(1+.02*A),o[A].gain.setValueAtTime(.25,audioContext.currentTime),o[A].gain.exponentialRampToValueAtTime(1e-4,audioContext.currentTime+e),t[A].connect(o[A]),o[A].connect(a).connect(masterGain).connect(bandpassFilter).connect(analyser).connect(audioContext.destination),t[A].start(audioContext.currentTime);setTimeout(()=>{for(let A=0;A<4;A++)t[A].stop(audioContext.currentTime)},1e3*e)}async function playAngelSound(e=4,q=100,t=.5,A=.5){const o=[];var a=[];var n=await getImpulseBuffer(audioContext,reverbData),i=audioContext.createConvolver(),n=(i.buffer=n,audioContext.createGain());n.gain.value=A,i.connect(n),n.connect(masterGain).connect(bandpassFilter).connect(analyser).connect(audioContext.destination);for(let A=0;A<4;A++)o[A]=audioContext.createOscillator(),a[A]=audioContext.createGain(),o[A].type=\"sine\",o[A].frequency.value=q*(1+.02*A),a[A].gain.setValueAtTime(t,audioContext.currentTime),a[A].gain.exponentialRampToValueAtTime(1e-4,audioContext.currentTime+e),o[A].connect(a[A]),a[A].connect(i),o[A].start(audioContext.currentTime);setTimeout(()=>{for(let A=0;A<4;A++)o[A].stop(audioContext.currentTime)},1e3*e)}initAudio(audioContext,reverbData,reverbDataShort).then(()=>{console.log(\"Audio data is decoded and ready to use!\")});let playElectricLoop=!1;async function playElectric(t=1e3,o=10,a=1,n=!1){console.log(`playElectric(${t}, ${o}, ${a})`);var A=await getImpulseBuffer(audioContext,reverbData),e=audioContext.createConvolver();e.buffer=A;const i=audioContext.createOscillator();i.type=\"sine\",i.frequency.setValueAtTime(t,audioContext.currentTime);A=audioContext.createGain();A.gain.setValueAtTime(.1,audioContext.currentTime);const s=audioContext.createOscillator();s.type=\"square\",s.frequency.setValueAtTime(50,audioContext.currentTime);var q=audioContext.createGain();q.gain.setValueAtTime(2e3,audioContext.currentTime);const g=audioContext.createOscillator();g.type=\"square\",g.frequency.setValueAtTime(a,audioContext.currentTime);var V=audioContext.createGain();V.gain.setValueAtTime(.2,audioContext.currentTime),s.connect(q),q.connect(i.frequency),i.connect(A),g.connect(V),V.connect(A.gain),A.connect(e),e.connect(masterGain).connect(bandpassFilter).connect(analyser).connect(audioContext.destination),i.start(),s.start(),g.start(),setTimeout(()=>{console.log(\"stop\"),i.stop(),s.stop(),g.stop();var A=t+(1e3*Math.random()-1e3*Math.random()),e=o+(3*Math.random()-3*Math.random()),q=a+(5*Math.random()-5*Math.random());0==n&&0==playElectricLoop||playElectric(A,e,q)},1e3*o),console.log(\"end\")}async function applyFXWithPanningLoopFade(A,e,q,t,o,a,n=1,i=1,s=1){var g=await getImpulseBuffer(e,reverbData),V=e.createConvolver();V.buffer=g;const r=e.createDelay(),c=(t=Math.min(Math.max(t,0),1),r.delayTime.value=t,e.createGain()),l=(c.gain.value=o,e.createStereoPanner()),C=(l.pan.value=a,e.createBufferSource()),E=(C.buffer=q,C.connect(r),r.connect(c),c.connect(V).connect(l),e.createGain());E.gain.value=n,E.gain.setValueAtTime(0,e.currentTime),E.gain.linearRampToValueAtTime(n,e.currentTime+i);g=q.duration;E.gain.setValueAtTime(n,e.currentTime+g-s),E.gain.linearRampToValueAtTime(0,e.currentTime+g),l.connect(E),E.connect(masterGain).connect(bandpassFilter).connect(analyser).connect(e.destination),r.connect(r),C.start();C.onended=()=>{1==app.audio&&0==holdOnSoundEvents&&(C.disconnect(),r.disconnect(),c.disconnect(),l.disconnect(),E.disconnect(),playEchoFXFade(A,r.delayTime.value,c.gain.value,l.pan.value,n,i,s),console.log(\"applyFXWithPanningLoop - ended\"))}}async function playEchoFXFade(A=\"noidechofade\",e=.2,q=.3,t=0,o=.23,a=1,n=1,i=1){console.log(A,e,q,t,o,a,n,i),app.audioContexts.push({id:\"echofx\",ctx:audioContext});var s=generateBreakingFXSize(audioContext);audioSources[A]=await applyFXWithPanningLoopFade(A,audioContext,s,e,q,t,o,a,n,i)}function altarEngage(){drum(\"kick\",.2)}function altarOpen(){doorsRev(\"open\",.4)}function altarSent(){doorsRev(\"close\",6)}function altarPop(){drum(\"hihat\",.2)}function altarSporadicDrop(){var A=2*Math.random(),e=60*Math.random();1<2*Math.random()?dropSound2(6+A,100,501,2+A,.1,.02):dropSound2(60+e,100,5,2,.1,.02)}async function makeChoir(e=5,q=3,t=260,A=.1){app.audioContexts.push({id:\"choir\",ctx:audioContext});var o=decodeBase64ToArrayBuffer(reverbData),o=await audioContext.decodeAudioData(o),a=audioContext.createConvolver(),n=(a.buffer=o,audioContext.createDynamicsCompressor()),i=(n.threshold.value=-12,n.knee.value=10,n.ratio.value=6,n.attack.value=.1,n.release.value=.5,audioContext.createGain()),s=[],g=[];for(let A=0;A<q;A++)s[A]=audioContext.createOscillator(),g[A]=audioContext.createGain(),s[A].connect(g[A]),g[A].connect(a),a.connect(n),n.connect(i),i.connect(masterGain).connect(bandpassFilter).connect(analyser).connect(audioContext.destination);var V=Math.pow(2,1/12);for(let A=0;A<q;A++)s[A].frequency.value=t*Math.pow(V,A-q/2),s[A].type=\"sine\";s[0].frequency.value=t,s[1].frequency.value=t*Math.pow(V,4),s[2].frequency.value=t*Math.pow(V,7),i.gain.value=A;for(let A=0;A<q;A++)s[A].start(),g[A].gain.setValueAtTime(.01,audioContext.currentTime),g[A].gain.linearRampToValueAtTime(1,audioContext.currentTime+.5);for(let A=0;A<q;A++)s[A].stop(audioContext.currentTime+e),g[A].gain.setValueAtTime(1,audioContext.currentTime+e-1),g[A].gain.linearRampToValueAtTime(.01,audioContext.currentTime+e),s[A].onended=function(){1==app.audio&&0==holdOnSoundEvents&&(app.audioContexts=app.audioContexts.filter(A=>\"choir\"!=A.id))}}let audioBuffer,storedAudioBuffer;function speech(e=100){var A=window.speechSynthesis;const a=app.system.Machine,q=audioContext.createGain();q.gain.value=.05;var t=audioContext.createWaveShaper(),o=new Float32Array(audioContext.sampleRate);for(let A=0;A<audioContext.sampleRate;A++){var n=2*A/audioContext.sampleRate-1;o[A]=(3+e)*n*20*Math.PI/(Math.PI+e*Math.abs(n))}t.curve=o;const i=audioContext.createConvolver();var s=decodeBase64ToArrayBuffer(reverbData);audioContext.decodeAudioData(s,function(A){i.buffer=A}),q.connect(t),t.connect(i),i.connect(masterGain).connect(bandpassFilter).connect(analyser).connect(audioContext.destination);const g=new SpeechSynthesisUtterance(a);g.voice=A.getVoices()[0],g.rate=.5,g.pitch=.5,g.lang=\"en-US\",g.volume=.25,g.onend=async()=>{var A=await new Promise(t=>{var A=new AudioBufferSourceNode(audioContext,{buffer:audioContext.createBuffer(1,1,audioContext.sampleRate)}),e=audioContext.createMediaStreamDestination();const q=new MediaRecorder(e.stream),o=(A.connect(e),[]);q.ondataavailable=A=>o.push(A.data),q.onstop=A=>{var e=new Blob(o);const q=new FileReader;q.onloadend=()=>{var A=q.result;audioContext.decodeAudioData(A,A=>{var e=A.getChannelData(0),q=new Float32Array(e.length);for(let A=0;A<e.length;A++)q[A]=e[A];t(q)})},q.readAsArrayBuffer(e)},q.start(),setTimeout(()=>q.stop(),1e3*a.split(\" \").length/g.rate)}),e=audioContext.createBuffer(1,A.length,audioContext.sampleRate),A=(e.getChannelData(0).set(A),audioContext.createBufferSource());A.buffer=e,A.connect(q),A.start(),storedAudioBuffer=e},A.speak(g)}let eventSounds=!0;async function playRev(A){var e=[...recordedChunks].reverse(),e=new Blob(e,{type:\"audio/webm\"}),e=URL.createObjectURL(e);const q=new Audio(e),t=audioContext.createConvolver();e=decodeBase64ToArrayBuffer(A),audioContext.decodeAudioData(e,A=>t.buffer=A),A=audioContext.createScriptProcessor(2048,2,2);let a=[];A.onaudioprocess=function(A){var e=A.inputBuffer,q=A.outputBuffer;for(let A=0;A<q.numberOfChannels;A++){var t=e.getChannelData(A),o=q.getChannelData(A);for(let A=0;A<e.length;A++)o[e.length-A-1]=t[A]}a.push(q)};audioContext.createMediaElementSource(q).connect(A),A.connect(t),t.connect(audioContext.destination);var e=new Promise(A=>{q.onended=()=>{A()}}),o=(q.play(),await e,audioContext.createBuffer(2,a[0].length*a.length,audioContext.sampleRate));for(let A=0;A<o.numberOfChannels;A++){var n=o.getChannelData(A);for(let e=0;e<a.length;e++){var i=a[e].getChannelData(A);for(let A=0;A<i.length;A++)n[e*i.length+A]=i[A]}}A=audioContext.createBufferSource();A.buffer=o,A.connect(audioContext.destination),A.start()}function setupRec(){var A=document.getElementById(\"recordButton\");document.getElementById(\"playButton\").onclick=function(){0<recordedChunks.length&&playRev(reverbData)},A.onclick=function(){startRecording(5e3)}}function playBackwards(A){var e=audioContext.createBufferSource(),q=(e.buffer=A,e.buffer.length),t=e.buffer.numberOfChannels,o=audioContext.createBuffer(t,q,audioContext.sampleRate);for(let A=0;A<t;A++){var a=e.buffer.getChannelData(A),n=o.getChannelData(A);for(let A=q-1;0<=A;A--)n[q-A-1]=a[A]}A=audioContext.createBufferSource();A.buffer=o,A.connect(masterGain).connect(bandpassFilter).connect(analyser).connect(audioContext.destination),A.start()}function noseSniff(){doors(\"close\",.01+Math.floor(2*Math.random()))}function boilingWater(A=0,e=.25,q=.1,t=1.5){(new Date).getTime();var o=2*audioContext.sampleRate,a=audioContext.createBuffer(1,o,audioContext.sampleRate),n=a.getChannelData(0);for(let A=0;A<o;A++){var i=Math.random()*e;n[A]=i-i*q}var s=audioContext.createBufferSource(),a=(s.buffer=a,s.loop=!0,audioContext.createGain()),g=audioContext.createBiquadFilter();g.type=\"lowpass\",g.frequency.value=1e3,s.connect(a),a.connect(g),g.connect(masterGain).connect(bandpassFilter).connect(analyser).connect(audioContext.destination),a.gain.setValueAtTime(0,audioContext.currentTime),a.gain.linearRampToValueAtTime(1,audioContext.currentTime+t),s.onended=function(){1==app.audio&&0==holdOnSoundEvents&&console.log(\"loop again\")},s.start()}async function playWhiteNoise(A=10,e=1e3,q=!1){const t=audioContext.createScriptProcessor(4096,1,1);var o=await getImpulseBuffer(audioContext,reverbData);const a=audioContext.createConvolver();a.buffer=o,t.onaudioprocess=function(A){var e=A.outputBuffer.getChannelData(0);for(let A=0;A<4096;A++)e[A]=.5*Math.random()-.5};o=audioContext.createBiquadFilter();o.type=\"bandpass\",o.frequency.value=e,o.Q.value=1;const n=audioContext.createOscillator();e=audioContext.createGain();n.type=\"sine\",n.frequency.value=5,e.gain.value=500,n.connect(e),e.connect(o.frequency),t.connect(o),o.connect(a).connect(masterGain).connect(bandpassFilter).connect(analyser).connect(audioContext.destination),n.start(),t.connect(a).connect(masterGain).connect(bandpassFilter).connect(analyser).connect(audioContext.destination),setTimeout(()=>{1==q&&(t.disconnect(a),t.onaudioprocess=null,n.stop())},1e3*A)}function makeNoise(e=1,A=1,q=1,t=1){var o=audioContext.createBufferSource(),q=audioContext.createBuffer(1,audioContext.sampleRate*q,audioContext.sampleRate),a=q.getChannelData(0);for(let A=0;A<a.length;A++)a[A]=Math.random()*e-e;o.buffer=q;q=audioContext.createGain();o.connect(q).connect(masterGain).connect(bandpassFilter).connect(analyser).connect(audioContext.destination),q.gain.setValueAtTime(A,audioContext.currentTime),q.gain.exponentialRampToValueAtTime(.01,audioContext.currentTime+t),o.start()}function isSecure(){return\"https:\"===location.protocol||location.protocol.startsWith(\"blob:\")}function isGetUserMediaSupported(){return!(!navigator.mediaDevices||!navigator.mediaDevices.getUserMedia)}let mediaRecorder,recordedChunks=[];async function startRecording(A){try{new(window.AudioContext||window.webkitAudioContext);var e=await navigator.mediaDevices.getUserMedia({audio:!0});(mediaRecorder=new MediaRecorder(e)).addEventListener(\"dataavailable\",A=>{0<A.data.size&&recordedChunks.push(A.data)}),mediaRecorder.start(),setTimeout(()=>{mediaRecorder.stop()},A)}catch(A){console.error(\"Error starting recording:\",A)}}function playRecording(){var A;0===recordedChunks.length?console.error(\"No audio data available for playback\"):(A=[...recordedChunks].reverse(),A=new Blob(A,{type:\"audio/ogg; codecs=opus\"}),A=URL.createObjectURL(A),A=new Audio(A),audio.playbackRate=-1,A.play())}function bufferToWav(q){var t=q.numberOfChannels,A=q.sampleRate,e=2===t?1:3,o=2*t,a=q.length,n=a*o,i=44+n,s=new ArrayBuffer(44),g=new DataView(s),V=(g.setUint32(0,1380533830,!1),g.setUint32(4,i-8,!0),g.setUint32(8,1463899717,!1),g.setUint32(12,1718449184,!1),g.setUint32(16,16,!0),g.setUint16(20,e,!0),g.setUint16(22,t,!0),g.setUint32(24,A,!0),g.setUint32(28,A*o,!0),g.setUint16(32,o,!0),g.setUint16(34,16,!0),g.setUint32(36,1684108385,!1),g.setUint32(40,n,!0),new Float32Array(a*t));for(let e=0;e<a;e++)for(let A=0;A<t;A++)V[e*t+A]=q.getChannelData(A)[e];var r=new Int16Array(i/2);for(let A=0;A<22;A++)r[A]=g.getInt16(2*A,!0);for(let A=0;A<a*t;A++)r[A+22]=32766*V[A];return r}async function playAxeSoundGapsSaveWav(V,r,c,o,l,C){const E=new OfflineAudioContext({numberOfChannels:2,length:44100*c*o,sampleRate:audioContext.sampleRate});var A=decodeBase64ToArrayBuffer(reverbData);audioContext.decodeAudioData(A,async function(s){let g=0;for(let A=0;A<o;A++)await new Promise(i=>{setTimeout(()=>{var A=E.createOscillator(),e=E.createGain(),q=E.createBufferSource(),t=E.createBuffer(1,E.sampleRate,E.sampleRate),o=E.createConvolver(),a=E.createStereoPanner(),n=(a.pan.value=2*Math.random()-1,t.getChannelData(0));for(let A=0;A<n.length;A++)n[A]=2*Math.random()-1;o.buffer=s,A.frequency.setValueAtTime(V,E.currentTime),A.connect(e),e.connect(a),a.connect(o),o.connect(E.destination),A.start(),A.stop(E.currentTime+.7*c),e.gain.setValueAtTime(r,E.currentTime),e.gain.exponentialRampToValueAtTime(.001,E.currentTime+c),q.buffer=t,q.connect(e),q.start(),q.stop(E.currentTime+.5*c),g+=c+l+Math.random()*(C-l),i()},1e3*g)});var A=bufferToWav(await E.startRendering()),A=new Blob([new DataView(A.buffer)],{type:\"audio/wav\"}),A=URL.createObjectURL(A);const e=document.createElementNS(\"http://www.w3.org/2000/svg\",\"foreignObject\");e.setAttribute(\"width\",\"100\"),e.setAttribute(\"height\",\"50\");var q=document.createElementNS(\"http://www.w3.org/1999/xhtml\",\"body\"),t=(e.appendChild(q),document.createElementNS(\"http://www.w3.org/1999/xhtml\",\"a\")),A=(t.href=A,t.download=\"recordedAudio.wav\",t.textContent=\"Download audio\",q.appendChild(t),document.querySelector(\"svg\").appendChild(e),new MouseEvent(\"click\",{view:window,bubbles:!0,cancelable:!0}));t.dispatchEvent(A),setTimeout(()=>{document.querySelector(\"svg\").removeChild(e)},100)})}async function playAxeSoundSaveOgg(V,r,c,e,l,C){const E=audioContext.createMediaStreamDestination();var A=decodeBase64ToArrayBuffer(reverbData);let o=[];const q=new MediaRecorder(E.stream);q.ondataavailable=A=>o.push(A.data),q.onstop=()=>{var A=new Blob(o,{type:\"audio/ogg; codecs=opus\"}),A=URL.createObjectURL(A);const e=document.createElementNS(\"http://www.w3.org/2000/svg\",\"foreignObject\");e.setAttribute(\"width\",\"100\"),e.setAttribute(\"height\",\"50\");var q=document.createElementNS(\"http://www.w3.org/1999/xhtml\",\"body\"),t=(e.appendChild(q),document.createElementNS(\"http://www.w3.org/1999/xhtml\",\"a\")),A=(t.href=A,t.download=\"recordedAudio.ogg\",t.textContent=\"Download audio\",q.appendChild(t),document.querySelector(\"svg\").appendChild(e),new MouseEvent(\"click\",{view:window,bubbles:!0,cancelable:!0}));t.dispatchEvent(A),setTimeout(()=>{document.querySelector(\"svg\").removeChild(e)},100)},q.start(),audioContext.decodeAudioData(A,async function(s){let g=0;for(let A=0;A<e;A++)await new Promise(i=>{setTimeout(()=>{var A=audioContext.createOscillator(),e=audioContext.createGain(),q=audioContext.createBufferSource(),t=audioContext.createBuffer(1,audioContext.sampleRate,audioContext.sampleRate),o=audioContext.createConvolver(),a=audioContext.createStereoPanner(),n=(a.pan.value=2*Math.random()-1,t.getChannelData(0));for(let A=0;A<n.length;A++)n[A]=2*Math.random()-1;o.buffer=s,A.frequency.setValueAtTime(V,audioContext.currentTime),A.connect(e),e.connect(a),a.connect(o),o.connect(E),A.start(),A.stop(audioContext.currentTime+.7*c),e.gain.setValueAtTime(r,audioContext.currentTime),e.gain.exponentialRampToValueAtTime(.001,audioContext.currentTime+c),q.buffer=t,q.connect(e),q.start(),q.stop(audioContext.currentTime+.5*c),g+=c+l+Math.random()*(C-l),i()},1e3*g)});setTimeout(()=>{q.stop()},1e3*(g+1))})}function playAxeSoundGaps(s=20,g=.1,V=.05,q=20,t=.02,o=.021){var A=decodeBase64ToArrayBuffer(reverbData);audioContext.decodeAudioData(A,function(i){let e=0;for(let A=0;A<q;A++)setTimeout(function(){var A=audioContext.createOscillator(),e=audioContext.createGain(),q=audioContext.createBufferSource(),t=audioContext.createBuffer(1,audioContext.sampleRate,audioContext.sampleRate),o=audioContext.createConvolver(),a=audioContext.createStereoPanner(),n=(a.pan.value=2*Math.random()-1,t.getChannelData(0));for(let A=0;A<n.length;A++)n[A]=2*Math.random()-1;o.buffer=i,A.frequency.setValueAtTime(s,audioContext.currentTime),A.connect(e),e.connect(a),a.connect(o),o.connect(masterGain).connect(bandpassFilter).connect(analyser).connect(audioContext.destination),A.start(),A.stop(audioContext.currentTime+.7*V),e.gain.setValueAtTime(g,audioContext.currentTime),e.gain.exponentialRampToValueAtTime(.001,audioContext.currentTime+V),q.buffer=t,q.connect(e),q.start(),q.stop(audioContext.currentTime+.5*V)},1e3*e),e+=V+t+Math.random()*(o-t)})}function playAxeSound2(s=100,g=.3,V=.2,e=6){var A=decodeBase64ToArrayBuffer(reverbData);audioContext.decodeAudioData(A,function(i){for(let A=0;A<e;A++)setTimeout(function(){var A=audioContext.createOscillator(),e=audioContext.createGain(),q=audioContext.createBufferSource(),t=audioContext.createBuffer(1,audioContext.sampleRate,audioContext.sampleRate),o=audioContext.createConvolver(),a=audioContext.createStereoPanner(),n=(a.pan.value=2*Math.random()-1,t.getChannelData(0));for(let A=0;A<n.length;A++)n[A]=2*Math.random()-1;o.buffer=i,A.frequency.setValueAtTime(s,audioContext.currentTime),A.connect(e),e.connect(a),a.connect(o),o.connect(audioContext.destination),A.start(),A.stop(audioContext.currentTime+.7*V),e.gain.setValueAtTime(g,audioContext.currentTime),e.gain.exponentialRampToValueAtTime(.001,audioContext.currentTime+V),q.buffer=t,q.connect(e),q.start(),q.stop(audioContext.currentTime+.5*V)},A*V*1e3)})}function playSteam(s=5,g=.7,V=1,e=1){var A=decodeBase64ToArrayBuffer(reverbData);audioContext.decodeAudioData(A,function(i){for(let A=0;A<e;A++)setTimeout(function(){var A=audioContext.createOscillator(),e=audioContext.createGain(),q=audioContext.createGain(),t=audioContext.createBufferSource(),o=audioContext.createBuffer(1,audioContext.sampleRate,audioContext.sampleRate),a=audioContext.createConvolver(),n=o.getChannelData(0);for(let A=0;A<n.length;A++)n[A]=2*Math.random()-1;a.buffer=i,A.frequency.setValueAtTime(s,audioContext.currentTime),A.connect(e),e.connect(q),q.connect(a),a.connect(audioContext.destination),A.start(),A.stop(audioContext.currentTime+V),q.gain.setValueAtTime(0,audioContext.currentTime),q.gain.linearRampToValueAtTime(g,audioContext.currentTime+.5*V),q.gain.linearRampToValueAtTime(.001,audioContext.currentTime+V),e.gain.setValueAtTime(g,audioContext.currentTime),e.gain.exponentialRampToValueAtTime(.001,audioContext.currentTime+V),t.buffer=o,t.connect(e),t.start(),t.stop(audioContext.currentTime+V)},A*V*1e3)})}function playAxeSound(i=300,s=.5,g=1,e=1){var A=decodeBase64ToArrayBuffer(reverbData);audioContext.decodeAudioData(A,function(n){for(let A=0;A<e;A++)setTimeout(function(){var A=audioContext.createOscillator(),e=audioContext.createGain(),q=audioContext.createBufferSource(),t=audioContext.createBuffer(1,audioContext.sampleRate,audioContext.sampleRate),o=audioContext.createConvolver(),a=t.getChannelData(0);for(let A=0;A<a.length;A++)a[A]=2*Math.random()-1;o.buffer=n,A.frequency.setValueAtTime(i,audioContext.currentTime),A.connect(e),e.connect(o),o.connect(masterGain).connect(bandpassFilter).connect(analyser).connect(audioContext.destination),A.start(),A.stop(audioContext.currentTime+.7*g),e.gain.setValueAtTime(s,audioContext.currentTime),e.gain.exponentia";

  function getPart() external pure returns (string memory) {
    return PART;
  }
  
}