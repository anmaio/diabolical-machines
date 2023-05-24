// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

library SoundImp14 {

  string internal constant PART = "lRampToValueAtTime(.001,audioContext.currentTime+g),q.buffer=t,q.connect(e).connect(masterGain).connect(bandpassFilter).connect(analyser).connect(audioContext.destination),q.start(),q.stop(audioContext.currentTime+.5*g)},A*g*1e3)})}function playAxeSoundShort(A=100,e=1){var q=audioContext.createOscillator(),t=audioContext.createGain(),o=audioContext.createBufferSource(),a=audioContext.createBuffer(1,.2*audioContext.sampleRate,audioContext.sampleRate),n=a.getChannelData(0);for(let A=0;A<n.length;A++)n[A]=2*Math.random()-1;q.frequency.setValueAtTime(A,audioContext.currentTime),q.connect(t),t.connect(audioContext.destination),q.start(),q.stop(audioContext.currentTime+.1),t.gain.setValueAtTime(e,audioContext.currentTime),t.gain.exponentialRampToValueAtTime(.001,audioContext.currentTime+.1),o.buffer=a,o.connect(t),o.start(),o.stop(audioContext.currentTime+.1)}function generateReverbImpulseResponse(e,A,q){var t=e.sampleRate*A,A=e.createBuffer(2,t,e.sampleRate),o=A.getChannelData(0),a=A.getChannelData(1);for(let A=0;A<t;A++){var n=500*Math.random()+100,n=(o[A]=Math.sin(2*Math.PI*A*n/e.sampleRate)*q,a[A]=o[A],Math.exp(-A/(.5*e.sampleRate)));o[A]*=n,a[A]*=n}return A}function generateBreakingGlassSound(e){var q=20*e.sampleRate,A=e.createBuffer(1,q,e.sampleRate),t=A.getChannelData(0);for(let A=0;A<q;A++){t[A]=.2*(5*Math.random()-1);var o=1e3*Math.random()+10,o=(t[A]+=.1*Math.sin(1.5*Math.PI*A*o/e.sampleRate),Math.exp(-A/(.15*e.sampleRate)));t[A]*=o}return A}async function applyReverb(A,e,q,t){var o=await getImpulseBuffer(A,reverbData),a=A.createConvolver(),o=(a.buffer=o,A.createBufferSource());o.buffer=e,o.connect(a),a.connect(masterGain).connect(bandpassFilter).connect(analyser).connect(A.destination),o.start()}function playExhaust(A=1,e=1){console.log(\"playExhaust\",A,e);var q=generateBreakingGlassSound(audioContext);applyReverb(audioContext,q,A,e)}function playExhaust2(A=1,e=1){var q=generateBreakingGlassSound2(audioContext);applyReverb(audioContext,q,A,e)}function oldDropsRandom(){var A=[{of:10,ff:100},{of:10,ff:200},{of:50,ff:300},{of:50,ff:100},{of:100,ff:100},{of:200,ff:100},{of:1e3,ff:100},{of:1e4,ff:500},{of:2e4,ff:1e3}],e=Math.floor(Math.random()*A.length);dropSoundOld(A[e].of,A[e].ff)}function dropSoundOld(A=10,e=100){var q=audioContext.createOscillator(),t=audioContext.createGain(),o=audioContext.createBiquadFilter();q.type=\"sawtooth\",q.frequency.value=A,o.type=\"lowpass\",o.frequency.value=e,q.frequency.exponentialRampToValueAtTime(100,audioContext.currentTime+.5),t.gain.setValueAtTime(1,audioContext.currentTime),t.gain.exponentialRampToValueAtTime(.001,audioContext.currentTime+1),q.connect(t).connect(o).connect(masterGain).connect(bandpassFilter).connect(analyser).connect(audioContext.destination),q.start(),q.stop(audioContext.currentTime+1),connectToAnalyser(audioContext,q),setTimeout(()=>reconnectToTalker(),1e3)}async function dropSound2(A=10,e=100,q=500,t=2,o=.1,a=.1){try{console.log(`dropSound2(${A},${e},${q},${t},${o})`);var n,i,s,g=decodeBase64ToArrayBuffer(reverbData),V=await audioContext.decodeAudioData(g),r=audioContext.createConvolver();r.buffer=V,A<0||22050<A?console.error(\"Invalid oscillator frequency\"):e<0||22050<e?console.error(\"Invalid filter frequency\"):q<0||22050<q?console.error(\"Invalid modulation frequency\"):(n=audioContext.createOscillator(),i=audioContext.createGain(),s=audioContext.createBiquadFilter(),n.type=\"sawtooth\",n.frequency.value=A,s.type=\"lowpass\",s.frequency.value=e,n.frequency.exponentialRampToValueAtTime(q,audioContext.currentTime+t),i.gain.setValueAtTime(.001,audioContext.currentTime),i.gain.linearRampToValueAtTime(a,audioContext.currentTime+.01),i.gain.setValueAtTime(a,audioContext.currentTime+o),i.gain.linearRampToValueAtTime(.001,audioContext.currentTime+2.99),i.connect(r).connect(masterGain).connect(bandpassFilter).connect(analyser).connect(audioContext.destination),n.connect(i).connect(s).connect(masterGain).connect(bandpassFilter).connect(analyser).connect(audioContext.destination),n.start(),n.stop(audioContext.currentTime+3))}catch(A){throw console.error(\"Error in dropSound2:\",A),A}}let stopEchoFXFadeFlag={};async function playEchoFX(A,e,q,t,o){app.audioContexts.push({id:\"echofx\",ctx:audioContext});var a=generateBreakingFX(audioContext);stopEchoFXFadeFlag[A]=!1,audioSources[A]=await applyFXWithPanningLoop(A,audioContext,a,e,q,t,o)}async function applyFXWithPanningLoop(A,e,q,t,o,a,n=1){var i=await getImpulseBuffer(e,reverbData),s=e.createConvolver(),i=(s.buffer=i,e.createDelay()),t=(t=Math.min(Math.max(t,0),1),i.delayTime.value=t,e.createGain()),o=(t.gain.value=o,e.createStereoPanner()),a=(o.pan.value=a,e.createBufferSource()),q=(a.buffer=q,a.connect(i),i.connect(t),t.connect(s).connect(o),e.createGain());q.gain.value=n,o.connect(q),q.connect(masterGain).connect(bandpassFilter).connect(analyser).connect(e.destination),i.connect(i),a.start();return a}function stopEchoFXFade(A){audioSources[A]&&audioSources[A].stop()}function generateBreakingFXSize(e){var q=15*e.sampleRate,A=e.createBuffer(1,q,e.sampleRate),t=A.getChannelData(0);for(let A=0;A<q;A++){t[A]=.2*(10.15*Math.random()-.15);var o=10*Math.random()+10,o=(t[A]+=.1*Math.sin(.5*Math.PI*A*o/e.sampleRate),Math.exp(-A/(.05*e.sampleRate)));t[A]*=o}return A}function generateBreakingFX(e){var q=30*e.sampleRate,A=e.createBuffer(1,q,e.sampleRate),t=A.getChannelData(0);for(let A=0;A<q;A++){t[A]=.2*(10.15*Math.random()-.15);var o=10*Math.random()+10,o=(t[A]+=.1*Math.sin(.5*Math.PI*A*o/e.sampleRate),Math.exp(-A/(.05*e.sampleRate)));t[A]*=o}return A}function applyEchoWithPanning(A,e,q,t,o,a){const n=A.createDelay(),i=(n.delayTime.value=q,A.createGain()),s=(i.gain.value=t,A.createStereoPanner()),g=(s.pan.value=o,A.createBufferSource());g.buffer=e,g.connect(n),n.connect(i),i.connect(s),s.connect(masterGain).connect(bandpassFilter).connect(analyser).connect(A.destination),n.connect(n),g.start();const V=setInterval(()=>{s.pan.value=-1*Math.random()+1},a);g.onended=()=>{clearInterval(V),g.disconnect(),n.disconnect(),i.disconnect(),s.disconnect(),1==app.audio&&0==holdOnSoundEvents&&playEcho(q,t,o,a)}}function generateBreakingGlassSound2(e){var q=20*e.sampleRate,A=e.createBuffer(1,q,e.sampleRate),t=A.getChannelData(0);for(let A=0;A<q;A++){t[A]=.2*(+Math.random()-1);var o=100*Math.random()+10,o=(t[A]+=.1*Math.sin(+Math.PI*A*o/e.sampleRate),Math.exp(-A/(.15*e.sampleRate)));t[A]*=o}return A}function playEcho(A,e,q,t){console.log(`playEcho(${A}, ${e}, ${q}, ${t})`);var o=generateBreakingGlassSound2(audioContext);applyEchoWithPanning(audioContext,o,A,e,q,t)}let lfo1,modOsc1,modulatorArgs=[[100,.03,20],[50,2,10],[120,3,10],[1.4,2e3,20],[2,5.2,50],[1,10,50],[.5,5,50],[4.6,16.6,50],[55.8,169,30],[428.7,19.1,30],[73.6,.5,30],[5.2,50.4,30]];function modulatorOldA(...A){console.log(A);var e=A[0],q=A[1],A=A[2],e=(null!=lfo1&&lfo1.stop(),null!=modOsc1&&modOsc1.stop(),(modOsc1=audioContext.createOscillator()).type=\"sine\",modOsc1.frequency.value=e,(lfo1=audioContext.createOscillator()).frequency.value=q,audioContext.createGain());e.gain.value=A,lfo1.connect(e),e.connect(modOsc1.frequency),modOsc1.start(),lfo1.start(),modOsc1.connect(masterGain).connect(bandpassFilter).connect(analyser).connect(audioContext.destination)}let lfo,modOsc,isStarted=!1;function modulatorA(...A){console.log(\"args: \",A.toString());var e=A[0],q=A[1],A=A[2],e=(console.log(\"modOscFreq\",e,\"lfoFreq:\",q,\"gain:\",A),isStarted&&(lfo.stop(),modOsc.stop(),isStarted=!1),(modOsc=audioContext.createOscillator()).type=\"triangle\",modOsc.frequency.value=e,(lfo=audioContext.createOscillator()).frequency.value=q,audioContext.createGain());e.gain.value=A,lfo.connect(e),e.connect(modOsc.frequency),modOsc.start(),lfo.start(),isStarted=!0,modOsc.connect(masterGain).connect(bandpassFilter).connect(analyser).connect(audioContext.destination)}function modulatorB(...A){console.log(\"args: \",A.toString());let e=\"sine\";var q=A[0],t=A[1],o=A[2],A=(null!=A[4]&&(e=A[4]),A[3]||.5),q=(console.log(\"modOscFreq\",q,\"lfoFreq:\",t,\"gain:\",o,\"outputGain:\",A),isStarted&&(lfo.stop(),modOsc.stop(),isStarted=!1),(modOsc=audioContext.createOscillator()).type=e,modOsc.frequency.value=q,(lfo=audioContext.createOscillator()).frequency.value=t,audioContext.createGain()),t=(q.gain.value=o,audioContext.createGain());t.gain.value=A,lfo.connect(q),q.connect(modOsc.frequency),modOsc.connect(t),t.connect(masterGain).connect(bandpassFilter).connect(analyser).connect(audioContext.destination),modOsc.start(),lfo.start(),isStarted=!0}let whiteNoise,gainNode,whiteNoiseFr=100,grow=0;function makeWhiteNoise(A,e,q){null==A&&(A=whiteNoiseFr),null!=whiteNoise&&whiteNoise.stop(),console.log(\"makeWhiteNoise\",audioContext.sampleRate);var t=2*audioContext.sampleRate,o=audioContext.createBuffer(2,t,audioContext.sampleRate),a=o.getChannelData(0),n=o.getChannelData(1);for(let A=0;A<t;A++)a[A]=1.98*Math.random()-1,n[A]=1.98*Math.random()-1;var i=audioContext.createConvolver(),s=(i.buffer=o,whiteNoise=audioContext.createBufferSource(),2*audioContext.sampleRate),o=audioContext.createBuffer(2,s,audioContext.sampleRate),g=o.getChannelData(0),V=o.getChannelData(1);for(let A=0;A<s;A++)g[A]=2*Math.random()-1,V[A]=2*Math.random()-1;whiteNoise.buffer=o,whiteNoise.loop=!0,whiteNoise.playbackRate.value=A/audioContext.sampleRate,whiteNoise.connect(i);o=audioContext.createGain(),o.gain.value=e,o.connect(masterGain).connect(bandpassFilter).connect(analyser).connect(audioContext.destination),i.connect(o),A=audioContext.createGain();A.gain.value=q,A.connect(masterGain).connect(bandpassFilter).connect(analyser).connect(audioContext.destination),whiteNoise.connect(whiteNoiseGain).connect(A),whiteNoise.start(),app.audioContexts=app.audioContexts.filter(A=>\"white-noise\"!=A.id),app.audioContexts.push({id:\"white-noise\",ctx:audioContext,osc:whiteNoise,gain:A,convolverGain:o,convolver:i})}function findCharState(){var A=[\"laying\",\"hunched\",\"meditating\",\"collapsed\",\"slouched\",\"sitting\",\"standing\"].map((A,e)=>({id:e,name:A,l:document.querySelectorAll(`g[id^=\"char-u-${A}\"]`).length})).sort((A,e)=>e.l-A.l);0==A[0].l?console.log(\"none\"):console.log(\"detected char position: \"+A[0].name)}function checkPerf(){var A;window.performance?(A=window.performance.timing.domContentLoadedEventEnd-window.performance.timing.navigationStart,console.log(`Page loaded in ${A} ms`),A=(new Date).getTime()-window.performance.timing.navigationStart,console.log(`Page age ${A/1e3} sec`)):console.log(\"Performance not here\")}function getAnimState(A){var A=document.querySelector(A),e=window.getComputedStyle(A),q=e.getPropertyValue(\"animation-name\"),e=e.getPropertyValue(\"animation-play-state\");\"my-animation\"===q&&\"running\"===e&&A.addEventListener(\"animationiteration\",function(A){\"my-animation\"===A.animationName&&(A=A.target.style.animationDuration*A.elapsedTime,console.log(\"Animation position:\",A))})}function playStringSimple(A){var A=A.split(\",\")[1]||A,e=atob(A),q=new Uint8Array(e.length);for(let A=0;A<e.length;A++)q[A]=e.charCodeAt(A);audioContext.decodeAudioData(q.buffer,A=>{var e=audioContext.createBufferSource();e.buffer=A,e.connect(masterGain).connect(bandpassFilter).connect(analyser).connect(audioContext.destination),e.start(0)})}function decodeBase64ToArrayBuffer(A){if(!/^[a-z0-9+/]+={0,2}$/i.test(A))throw new Error(\"Invalid base64 data\");var e=atob(A),q=e.length,A=new ArrayBuffer(q),t=new Uint8Array(A);for(let A=0;A<q;A++)t[A]=e.charCodeAt(A);return A}let canvasText=\"\";function playString(A){var A=A.split(\",\")[1]||A,e=atob(A),q=new Uint8Array(e.length);for(let A=0;A<e.length;A++)q[A]=e.charCodeAt(A);audioContext.decodeAudioData(q.buffer,q=>{const t=audioContext.createConvolver(),o=(t.buffer=reverbBuffer,audioContext.createGain()),a=(o.gain.value=1,()=>{var A=audioContext.createBufferSource(),e=(A.buffer=q,A.playbackRate.value=.5*Math.random()+.75,A.connect(o),o.connect(t),t.connect(masterGain).connect(bandpassFilter).connect(analyser).connect(audioContext.destination),.5*Math.random());A.start(audioContext.currentTime+e),A.onended=function(){1==app.audio&&0==holdOnSoundEvents&&a()}});a()})}showConsole=!1;let animationID,averageVolume;function getVolume(){analyser.fftSize=8192;var e=analyser.frequencyBinCount,q=new Uint8Array(e);analyser.getByteFrequencyData(q);let t=0;for(let A=0;A<e;A++)t+=q[A];averageVolume=t/e;null!=document.getElementById(\"volume-ui\")&&(document.getElementById(\"volume-ui\").innerHTML=\"Vol: \"+parseFloat(averageVolume.toFixed(2)))}function analyserUI(l=0,C=130){if(null!=document.getElementById(\"analyserCanvas\")){analyser.fftSize=8192;const E=analyser.frequencyBinCount,B=new Uint8Array(E),u=document.getElementById(\"analyserCanvas\"),M=u.getContext(\"2d\"),m=u.width/2,I=u.height/2;!function A(){animationID=requestAnimationFrame(A);let e=0;for(let A=0;A<E;A++)e+=B[A];averageVolume=e/E,analyser.getByteFrequencyData(B),M.clearRect(0,0,u.width,u.height);var q=2*Math.PI/360;for(let A=0;A<360;A++){var t=A*q,o=(A+1)*q,a=360*A/360;M.beginPath(),M.arc(m,I,l,t,o),M.strokeStyle=`hsl(${a}, 100%, 50%)`,M.stroke()}var n=Math.PI/E;for(let A=0;A<2*E;A++){var i=B[A%E]/128*C,s=A*n,g=m+l*Math.cos(s)+i*Math.cos(s),i=I+l*Math.sin(s)+i*Math.sin(s),V=360*A/(2*E);M.strokeStyle=`hsl(${V}, 100%, 50%)`,M.beginPath(),M.moveTo(m+l*Math.cos(s),I+l*Math.sin(s)),M.lineTo(g,i),M.stroke()}M.font=\"45px Arial\",M.fillStyle=\"rgba(255,255,255,0.5)\",M.fillText(canvasText,70,65);var r=u.width*(averageVolume/100),c=M.createLinearGradient(0,0,u.width,0);c.addColorStop(0,\"red\"),c.addColorStop(.5,\"yellow\"),c.addColorStop(1,\"blue\"),M.fillStyle=c,M.fillRect(0,u.height-4,r,4)}()}}function getRMSLevel(A){const t=new Float32Array(4096);var e=A.context.createGain(),q=A.context.createScriptProcessor(4096,1,1);return e.connect(q),q.connect(A.context.destination),q.onaudioprocess=A=>{var e=A.inputBuffer.getChannelData(0);let q=0;for(let A=0;A<e.length;A++)q+=e[A]*e[A];A=Math.sqrt(q/e.length);t.push(A),4096<t.length&&t.shift()},A.connect(e),20*Math.log10(t.reduce((A,e)=>A+e,0)/t.length)}function getPlayingHeadPosition(A){var e=A.playbackRate.value;return Math.max(0,audioContext.currentTime-A.startTime)*e}function playStringPanOnce(A,n){A=decodeBase64ToArrayBuffer(A.split(\",\")[1]||A);null==bandpassFilter&&((bandpassFilter=audioContext.createBiquadFilter()).type=\"bandpass\",bandpassFilter.frequency.value=app.psc.bandpassFreq,bandpassFilter.Q.value=app.psc.bandpassQ),(masterGain=null==masterGain?audioContext.createGain():masterGain).connect(bandpassFilter).connect(analyser).connect(audioContext.destination);let i;audioContext.decodeAudioData(A,A=>{const e=audioContext.createConvolver(),q=(e.buffer=reverbBuffer,audioContext.createGain()),t=audioContext.createGain(),o=audioContext.createStereoPanner();o.pan.value=1-+Math.random();var a;1==app.audio&&0==holdOnSoundEvents&&((i=audioContext.createBufferSource()).buffer=A,a=app.psc.initRate+Math.random()*app.psc.randomRate,i.playbackRate.value=a,i.connect(q),q.connect(bandpassFilter),bandpassFilter.connect(masterGain),i.connect(t),t.connect(o),o.connect(e),e.connect(bandpassFilter),4<A.duration||A.duration,Math.random(),a=app.psc.delay+Math.random()*app.psc.randomDelay,A.duration,A=Math.random()*app.psc.maxOffset,a=audioContext.currentTime+a,i.start(a,A),i.startTime=a,i.onended=()=>{console.log(\"ended:\",n)})})}async function playStringPan(A,e){var A=decodeBase64ToArrayBuffer(A.split(\",\")[1]||A),q=await getImpulseBufferShort(audioContext,reverbDataShort);const n=audioContext.createConvolver();n.buffer=q,isNull(\"soundBGName\")||(document.getElementById(\"soundBGName\").innerHTML=e,document.getElementById(\"soundBandPass\").value=bandpassFilter.frequency.value,document.getElementById(\"soundBandPass_val\").innerHTML=\"Band Pass Freq: \"+bandpassFilter.frequency.value,document.getElementById(\"soundBandPassQ\").value=bandpassFilter.Q.value,document.getElementById(\"soundBandPassQ_val\").innerHTML=\"Band Pass Q: \"+bandpassFilter.Q.value,document.getElementById(\"audioPanel\").style.display=\"inline-block\",document.getElementById(\"soundMasterGain\").value=masterGain.gain.value,document.getElementById(\"soundMasterGain_val\").innerHTML=\"Master Gain: \"+masterGain.gain.value);let i;audioContext.decodeAudioData(A,q=>{audioContext.createGain();const t=audioContext.createGain(),o=audioContext.createStereoPanner(),a=(o.pan.value=1-+Math.random(),()=>{var A,e;1==app.audio&&0==holdOnSoundEvents&&((i=audioContext.createBufferSource()).buffer=q,e=app.psc.initRate+Math.random()*app.psc.randomRate,i.playbackRate.value=e,i.connect(t),t.connect(o).connect(n).connect(masterGain).connect(bandpassFilter).connect(analyser).connect(audioContext.destination),4<q.duration||q.duration,Math.random(),e=app.psc.delay+Math.random()*app.psc.randomDelay,q.duration,A=Math.random()*app.psc.maxOffset,e=audioContext.currentTime+e,i.start(e,A),i.startTime=e,i.onended=()=>{a()},getPlayingHeadPosition(i))});a()})}function glitchEffectSVG(){const e=document.documentElement,A=setInterval(()=>{var A=.99+.15*Math.random();e.style.transform=`scale(${A})`},10);setTimeout(()=>{clearInterval(A),e.style.transform=\"\"},100)}let soundEvents=[];function generateWhiteNoise(A){var e=2*A.sampleRate,A=A.createBuffer(1,e,A.sampleRate),q=A.getChannelData(0);for(let A=0;A<e;A++)q[A]=2*Math.random()-1;return A}async function doorsRev(A,e=1){console.log(A,e);var q=await getImpulseBufferShort(audioContext,reverbDataShort),t=audioContext.createConvolver(),q=(t.buffer=q,generateWhiteNoise(audioContext)),o=audioContext.createBufferSource(),q=(o.buffer=q,o.loop=!0,audioContext.createBiquadFilter()),a=(q.type=\"bandpass\",audioContext.createGain()),n=(a.gain.value=.1,audioContext.createOscillator()),i=(n.type=\"sine\",audioContext.createGain());i.gain.value=0,o.connect(q).connect(a).connect(t).connect(masterGain).connect(bandpassFilter).connect(analyser).connect(audioContext.destination),n.connect(i).connect(t).connect(masterGain).connect(bandpassFilter).connect(analyser).connect(audioContext.destination),\"open\"===A?(q.frequency.setValueAtTime(200,audioContext.currentTime),q.frequency.linearRampToValueAtTime(2e3,audioContext.currentTime+e),n.frequency.setValueAtTime(50,audioContext.currentTime),n.frequency.linearRampToValueAtTime(500,audioContext.currentTime+e)):\"close\"===A&&(q.frequency.setValueAtTime(2e3,audioContext.currentTime),q.frequency.linearRampToValueAtTime(200,audioContext.currentTime+e),n.frequency.setValueAtTime(500,audioContext.currentTime),n.frequency.linearRampToValueAtTime(50,audioContext.currentTime+e)),o.start(),n.start(),o.stop(audioContext.currentTime+e),n.stop(audioContext.currentTime+e)}function doors(A,e=1){var q=generateWhiteNoise(audioContext),t=audioContext.createBufferSource(),q=(t.buffer=q,t.loop=!0,audioContext.createBiquadFilter()),o=(q.type=\"bandpass\",audioContext.createGain()),a=(o.gain.value=.1,audioContext.createOscillator()),n=(a.type=\"sine\",audioContext.createGain());n.gain.value=0,t.connect(q).connect(o).connect(masterGain).connect(bandpassFilter).connect(analyser).connect(audioContext.destination),a.connect(n).connect(masterGain).connect(bandpassFilter).connect(analyser).connect(audioContext.destination),\"open\"===A?(q.frequency.setValueAtTime(200,audioContext.currentTime),q.frequency.linearRampToValueAtTime(2e3,audioContext.currentTime+e),a.frequency.setValueAtTime(50,audioContext.currentTime),a.frequency.linearRampToValueAtTime(500,audioContext.currentTime+e)):\"close\"===A&&(q.frequency.setValueAtTime(2e3,audioContext.currentTime),q.frequency.linearRampToValueAtTime(200,audioContext.currentTime+e),a.frequency.setValueAtTime(500,audioContext.currentTime),a.frequency.linearRampToValueAtTime(50,audioContext.currentTime+e)),t.start(),a.start(),t.stop(audioContext.currentTime+e),a.stop(audioContext.currentTime+e)}function conveyorIn(){doors(\"open\")}function conveyorOut(){doors(\"close\")}function playWaterInPipes2(){try{for(let A=0;A<5;A++){var e=100+200*Math.random(),q=audioContext.currentTime+.5*A/2;t=e,o=q,i=n=a=void 0,(a=audioContext.createOscillator()).type=\"sine\",a.frequency.setValueAtTime(t,o),(t=audioContext.createGain()).gain.setValueAtTime(0,o),t.gain.linearRampToValueAtTime(1,o+.01),t.gain.linearRampToValueAtTime(0,o+.5),(n=audioContext.createBiquadFilter()).type=\"lowpass\",n.frequency.setValueAtTime(800,o),(i=audioContext.createBiquadFilter()).type=\"highpass\",i.frequency.setValueAtTime(100,o),a.connect(t).connect(n).connect(i).connect(masterGain).connect(bandpassFilter).connect(analyser).connect(audioContext.destination),a.start(o),a.stop(";

  function getPart() external pure returns (string memory) {
    return PART;
  }
  
}