// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract EyesImp3 {
  string internal constant C_EYE_K = "<g id='be-u-c-eye-k-all'><g id='be-u-c-eye-b2' transform='matrix(-.575-.995929 0.995929-.575 202.975818 888.882575)'><g id='be-u-c-eye-rog3' transform='matrix(-1 0 0 1 1099.56781 107)'><g id='be-u-l3' transform='translate(-11.666668 5.833334)'><path id='be-u-pal-c1-s133' d='M715.972435,336.48c2.480062-11.291159,5.553008-17.060913,10.517565-17.460746-.21-.14-1.33-1.649254-1.54-1.769254-6.91-3.87-15.34925,1.649034-16.98925,15.089034C706.22075,346.569035,712.53,364.17,719.87,369.66c1.62,1.21,3.25,1.81,4.81,1.85.28,0,.55-.02.82-.04-.19-.13-.38-.26-.57-.4-7.096008-5.574237-9.489399-21.047816-9.16-34.769999q-.495374.179999.202435.179999Z' transform='matrix(1.08 0 0 1-94.397568-23)' fill='url(#be-u-pal-c1-s133-fill)' stroke-width='1.01'/><path id='be-u-path-y5' d='M698.77,331.99c1.74-14.23-2.81-30.27-10.15-35.76-.2-.15-.39-.28-.59-.41-5.15.52-9.52,7.14-10.81,17.66-1.74,14.23,2.81,30.27,10.15,35.76.19.14.38.28.57.4c5.16-.52,9.54-7.13,10.82-17.66Z' transform='translate(2 0)' fill='#fae676' stroke='#000'/></g></g><g id='be-u-c-eye-b-mg3' transform='matrix(1 0 0 1.1 0-43.516747)'><g id='be-u-c-eye-b-l3' transform='translate(-43.333331 43.30303)'><path id='be-s-path271' d='M476.19,410.4c-7.4,8.95-16.58,7.69-20.66-2.67-.08-.2-.16-.39-.23-.6-.56-1.54-.98-3.19-1.27-4.91-1.78-10.46,1.22-23.55,7.6-31.26.97-1.18,1.98-2.17,3-2.99c6.8-5.45,14.36-3.12,17.89,6.25c4.06,10.78,1.21,27.06-6.33,36.17Z' fill='none' stroke='#000' stroke-width='1.01'/><g id='be-u-clip-group30' clip-path='url(#be-u-clipping-paths31)'><g id='be-u-c-eye-b-eyelids3' transform='translate(0 0.000001)'><g transform='translate(469.56559,377.879997)' style='animation:be-u-el1-c1b-s15_to__to 20000ms linear 999 normal forwards'><path id='be-u-el1-c1b-s15' d='M308.468153,325.036058L353.69628,301.59269l.85371-34.582693-45.968805.55-.113032,57.476061Z' transform='translate(-331.565587,-297.879997)' fill='var(--c1b)' stroke='#000'/></g><g transform='translate(469.56559,412.879997)' style='animation:be-u-el2-c1b-s15_to__to 20000ms linear 999 normal forwards'><path id='be-u-el2-c1b-s15' d='M309.039444,329.560324c0,0,45.880137-23.357053,45.880137-23.357053l-.369591-39.193274-45.968805.55.458259,62.000327Z' transform='scale(-1,-1) translate(-331.565587,-297.879997)' fill='var(--c1b)' stroke='#000'/></g></g><clipPath id='be-u-clipping-paths31'><path id='be-u-c-eye-b-eyelids-cp3' d='M476.19,410.4c-7.4,8.95-16.58,7.69-20.66-2.67-.08-.2-.16-.39-.23-.6-.56-1.54-.98-3.19-1.27-4.91-1.78-10.46,1.22-23.55,7.6-31.26.97-1.18,1.98-2.17,3-2.99c6.8-5.45,14.36-3.12,17.89,6.25c4.06,10.78,1.21,27.06-6.33,36.17Z' stroke-width='1.01'/></clipPath></g></g></g></g><g id='be-u-c-eye-b1' transform='matrix(-.575-.995929 0.995929-.575 301.075461 927.250185)'><g id='be-u-c-eye-rog4' transform='matrix(-1 0 0 1 1099.56781 107)'><g id='be-u-l4' transform='translate(-11.666668 5.833334)'><path id='be-u-pal-c1-s134' d='M715.972435,336.48c2.480062-11.291159,5.553008-17.060913,10.517565-17.460746-.21-.14-1.33-1.649254-1.54-1.769254-6.91-3.87-15.34925,1.649034-16.98925,15.089034C706.22075,346.569035,712.53,364.17,719.87,369.66c1.62,1.21,3.25,1.81,4.81,1.85.28,0,.55-.02.82-.04-.19-.13-.38-.26-.57-.4-7.096008-5.574237-9.489399-21.047816-9.16-34.769999q-.495374.179999.202435.179999Z' transform='matrix(1.08 0 0 1-94.397568-23)' fill='url(#be-u-pal-c1-s133-fill)' stroke-width='1.01'/><path id='be-u-path-y6' d='M698.77,331.99c1.74-14.23-2.81-30.27-10.15-35.76-.2-.15-.39-.28-.59-.41-5.15.52-9.52,7.14-10.81,17.66-1.74,14.23,2.81,30.27,10.15,35.76.19.14.38.28.57.4c5.16-.52,9.54-7.13,10.82-17.66Z' transform='translate(2 0)' fill='#fae676' stroke='#000'/></g></g><g id='be-u-c-eye-b-mg4' transform='matrix(1 0 0 1.1 0-43.516747)'><g id='be-u-c-eye-b-l4' transform='translate(-43.333331 43.30303)'><path id='be-s-path275' d='M476.19,410.4c-7.4,8.95-16.58,7.69-20.66-2.67-.08-.2-.16-.39-.23-.6-.56-1.54-.98-3.19-1.27-4.91-1.78-10.46,1.22-23.55,7.6-31.26.97-1.18,1.98-2.17,3-2.99c6.8-5.45,14.36-3.12,17.89,6.25c4.06,10.78,1.21,27.06-6.33,36.17Z' fill='none' stroke='#000' stroke-width='1.01'/><g id='be-u-clip-group31' clip-path='url(#be-u-clipping-paths32)'><g id='be-u-c-eye-b-eyelids4' transform='translate(0 0.000001)'><g transform='translate(469.56559,377.879997)' style='animation:be-u-el1-c1b-s16_to__to 20000ms linear 999 normal forwards'><path id='be-u-el1-c1b-s16' d='M308.468153,325.036058L353.69628,301.59269l.85371-34.582693-45.968805.55-.113032,57.476061Z' transform='translate(-331.565587,-297.879997)' fill='var(--c1b)' stroke='#000'/></g><g transform='translate(469.56559,412.879997)' style='animation:be-u-el2-c1b-s16_to__to 20000ms linear 999 normal forwards'><path id='be-u-el2-c1b-s16' d='M309.039444,329.560324c0,0,45.880137-23.357053,45.880137-23.357053l-.369591-39.193274-45.968805.55.458259,62.000327Z' transform='scale(-1,-1) translate(-331.565587,-297.879997)' fill='var(--c1b)' stroke='#000'/></g></g><clipPath id='be-u-clipping-paths32'><path id='be-u-c-eye-b-eyelids-cp4' d='M476.19,410.4c-7.4,8.95-16.58,7.69-20.66-2.67-.08-.2-.16-.39-.23-.6-.56-1.54-.98-3.19-1.27-4.91-1.78-10.46,1.22-23.55,7.6-31.26.97-1.18,1.98-2.17,3-2.99c6.8-5.45,14.36-3.12,17.89,6.25c4.06,10.78,1.21,27.06-6.33,36.17Z' stroke-width='1.01'/></clipPath></g></g></g></g></g>";

  string internal constant C_EYE_L = "<g id='be-u-eyes-l'><g id='be-u-c-eye-l1' transform='translate(204.848271 28.469787)'><g id='be-u-base-c1-s1'><path id='be-s-path162' d='M113.98,504.12v0c0,0,.06-.04.06-.04.05-.03.1-.06.15-.08l9.9-5.72c2.54-1.82,6.21-1.75,10.26.64c7.63,4.5,13.86,15.45,13.86,24.34c0,4.46-1.57,7.61-4.1,9.1l-10.45,6.03c-2.51,1.5-5.98,1.33-9.79-.85-7.62-4.36-13.85-15.3-13.85-24.31c0-4.44,1.52-7.59,3.96-9.11Z' fill='url(#be-s-path162-fill-c1-s1)' stroke='#000'/></g><g id='be-u-face'><g id='be-u-group-c1-s125'><path id='be-s-path163' d='M109.78,513.32c0-9.02,6.24-12.73,13.86-8.23c7.63,4.5,13.86,15.45,13.86,24.34s-6.24,12.6-13.86,8.23c-7.63-4.36-13.86-15.31-13.86-24.34Z' fill='var(--c1b)'/><path id='be-s-path164' d='M109.78,513.32c0-9.02,6.24-12.73,13.86-8.23c7.63,4.5,13.86,15.45,13.86,24.34s-6.24,12.6-13.86,8.23c-7.63-4.36-13.86-15.31-13.86-24.34Z' fill='url(#be-s-path164-fill-c1-s125)' stroke='#000'/></g></g><g id='be-u-eye'><g id='be-s-g102'><path id='be-u-y-light' d='M113.82,516.81c0-5.87,4.06-8.28,9.02-5.36c4.96,2.93,9.02,10.05,9.02,15.84s-4.06,8.2-9.02,5.36-9.02-9.97-9.02-15.84Z' fill='#fae676'/></g></g><g id='be-u-c-eye-l-lids-anim' transform='translate(0 0.000001)'><g id='be-u-clip-group10' clip-path='url(#be-u-clipping-paths10)'><g id='be-u-lids-group'><g transform='translate(123.299989,513.473652)' style='animation:be-u-lidmask-1-c1b-s1_to__to 20000ms linear 999 normal forwards'><path id='be-u-lidmask-1-c1b-s1' d='M97.515169,520.896093l20.15482,11.666223v-17.127328l-18.74-11.05-1.41482,16.511105Z' transform='translate(-108.299989,-518.473652)' fill='var(--c1b)' stroke='#000'/></g><g transform='translate(123.299989,530.473652)' style='animation:be-u-lidmask-2-c1b-s1_to__to 20000ms linear 999 normal forwards'><path id='be-u-lidmask-2-c1b-s1' d='M98.929989,521.674988l18.74,10.887328v-17.127328l-20.63904-11.829427l1.89904,18.069427Z' transform='translate(-108.299989,-518.473652)' fill='var(--c1b)' stroke='#000'/></g></g><clipPath id='be-u-clipping-paths10'><path id='be-u-lids-clip-path' d='M113.82,516.81c0-5.87,4.06-8.28,9.02-5.36c4.96,2.93,9.02,10.05,9.02,15.84s-4.06,8.2-9.02,5.36-9.02-9.97-9.02-15.84Z' fill='#51c4d7' stroke='#000'/></clipPath></g></g><path id='be-u-eye-circle' d='M113.82,516.81c0-5.87,4.06-8.28,9.02-5.36c4.96,2.93,9.02,10.05,9.02,15.84s-4.06,8.2-9.02,5.36-9.02-9.97-9.02-15.84Z' fill='none' stroke='#000'/></g><g id='be-u-c-eye-l2' transform='translate(238.848271 46.469787)'><g id='be-u-base-c1-s12'><path id='be-s-path166' d='M113.98,504.12v0c0,0,.06-.04.06-.04.05-.03.1-.06.15-.08l9.9-5.72c2.54-1.82,6.21-1.75,10.26.64c7.63,4.5,13.86,15.45,13.86,24.34c0,4.46-1.57,7.61-4.1,9.1l-10.45,6.03c-2.51,1.5-5.98,1.33-9.79-.85-7.62-4.36-13.85-15.3-13.85-24.31c0-4.44,1.52-7.59,3.96-9.11Z' fill='url(#be-s-path162-fill-c1-s1)' stroke='#000'/></g><g id='be-u-face2'><g id='be-u-group-c1-s126'><path id='be-s-path167' d='M109.78,513.32c0-9.02,6.24-12.73,13.86-8.23c7.63,4.5,13.86,15.45,13.86,24.34s-6.24,12.6-13.86,8.23c-7.63-4.36-13.86-15.31-13.86-24.34Z' fill='var(--c1b)'/><path id='be-s-path168' d='M109.78,513.32c0-9.02,6.24-12.73,13.86-8.23c7.63,4.5,13.86,15.45,13.86,24.34s-6.24,12.6-13.86,8.23c-7.63-4.36-13.86-15.31-13.86-24.34Z' fill='url(#be-s-path164-fill-c1-s125)' stroke='#000'/></g></g><g id='be-u-eye2'><g id='be-s-g103'><path id='be-u-y-light2' d='M113.82,516.81c0-5.87,4.06-8.28,9.02-5.36c4.96,2.93,9.02,10.05,9.02,15.84s-4.06,8.2-9.02,5.36-9.02-9.97-9.02-15.84Z' fill='#fae676'/></g></g><g id='be-u-c-eye-l-lids-anim2' transform='translate(0 0.000001)'><g id='be-u-clip-group11' clip-path='url(#be-u-clipping-paths11)'><g id='be-u-lids-group2'><g transform='translate(123.299989,513.473652)' style='animation:be-u-lidmask-1-c1b-s12_to__to 20000ms linear 999 normal forwards'><path id='be-u-lidmask-1-c1b-s12' d='M97.515169,520.896093l20.15482,11.666223v-17.127328l-18.74-11.05-1.41482,16.511105Z' transform='translate(-108.299989,-518.473652)' fill='var(--c1b)' stroke='#000'/></g><g transform='translate(123.299989,530.473652)' style='animation:be-u-lidmask-2-c1b-s12_to__to 20000ms linear 999 normal forwards'><path id='be-u-lidmask-2-c1b-s12' d='M98.929989,521.674988l18.74,10.887328v-17.127328l-20.63904-11.829427l1.89904,18.069427Z' transform='translate(-108.299989,-518.473652)' fill='var(--c1b)' stroke='#000'/></g></g><clipPath id='be-u-clipping-paths11'><path id='be-u-lids-clip-path2' d='M113.82,516.81c0-5.87,4.06-8.28,9.02-5.36c4.96,2.93,9.02,10.05,9.02,15.84s-4.06,8.2-9.02,5.36-9.02-9.97-9.02-15.84Z' fill='#51c4d7' stroke='#000'/></clipPath></g></g><path id='be-u-eye-circle2' d='M113.82,516.81c0-5.87,4.06-8.28,9.02-5.36c4.96,2.93,9.02,10.05,9.02,15.84s-4.06,8.2-9.02,5.36-9.02-9.97-9.02-15.84Z' fill='none' stroke='#000'/></g></g>";

  string internal constant C_EYE_M = "<g id='be-u-c-eye-b' transform='matrix(-1.198562-.086047-.02317 1.199776 872.026203-114.55363)'><g id='be-s-g151' transform='matrix(-.996195-.087156-.087156 0.996195 682.667034 13.008818)'><g id='be-u-c-eye-rog2' transform='matrix(-1 0 0 1 1099.56781 107)'><g id='be-u-l2' transform='translate(-11.666668 5.833334)'><path id='be-u-pal-c1-s132' d='M715.972435,336.48c2.480062-11.291159,5.553008-17.060913,10.517565-17.460746-.21-.14-1.33-1.649254-1.54-1.769254-6.91-3.87-15.34925,1.649034-16.98925,15.089034C706.22075,346.569035,712.53,364.17,719.87,369.66c1.62,1.21,3.25,1.81,4.81,1.85.28,0,.55-.02.82-.04-.19-.13-.38-.26-.57-.4-7.096008-5.574237-9.489399-21.047816-9.16-34.769999q-.495374.179999.202435.179999Z' transform='matrix(1.08 0 0 1-94.397568-23)' fill='url(#be-u-pal-c1-s13-fill)' stroke-width='1.01'/><path id='be-u-path-y3' d='M698.77,331.99c1.74-14.23-2.81-30.27-10.15-35.76-.2-.15-.39-.28-.59-.41-5.15.52-9.52,7.14-10.81,17.66-1.74,14.23,2.81,30.27,10.15,35.76.19.14.38.28.57.4c5.16-.52,9.54-7.13,10.82-17.66Z' transform='translate(2 0)' fill='#fae676' stroke='#000'/></g><g id='be-u-r2'><path id='be-u-pa-c1-s122' d='M715.77,336.3c1.29-10.519999,5.57-16.760746,10.72-17.280746-.21-.14-1.33-1.649254-1.54-1.769254-6.91-3.87-16.009983,2.09-17.649983,15.53-1.74,14.230001,5.229983,31.39,12.569983,36.88c1.62,1.21,3.25,1.81,4.81,1.85.28,0,.55-.02.82-.04-.19-.13-.38-.26-.57-.4-7.33-5.49-10.9-20.54-9.16-34.769999q-.697809-.000001,0-.000001Z' transform='translate(1 0)' fill='url(#be-u-pal-c1-s13-fill)' stroke-width='1.01'/><path id='be-u-path-y4' d='M736.32,353.81c1.74-14.23-2.81-30.27-10.15-35.76-.2-.15-.39-.28-.59-.41-5.15.52-9.52,7.14-10.81,17.66-1.74,14.23,2.81,30.27,10.15,35.76.19.14.38.28.57.4c5.16-.52,9.54-7.13,10.82-17.66Z' transform='translate(2 1)' fill='#fae676' stroke='#000'/></g></g><g id='be-u-c-eye-b-mg2' transform='matrix(1 0 0 1.1 0-43.516747)'><g id='be-u-c-eye-b-r2' transform='translate(62.000001-30.90909)'><path id='be-s-path244' d='M321.09,500.19c-7.4,8.95-16.58,7.69-20.66-2.67-.08-.2-.16-.39-.23-.6-.56-1.54-.98-3.19-1.27-4.91-1.78-10.46,1.22-23.55,7.6-31.26.97-1.18,1.98-2.17,3-2.99c6.8-5.45,14.36-3.12,17.89,6.25c4.06,10.78,1.21,27.06-6.33,36.17Z' fill='none' stroke='#000' stroke-width='1.01'/><g id='be-u-clip-group27' clip-path='url(#be-u-clipping-paths28)'><g id='be-u-c-eye-b-r-eyelids2' transform='translate(0 0.000001)'><g transform='translate(469.56559,412.879997)' style='animation:be-u-el2-c1b-s13_to__to 20000ms linear 999 normal forwards'><path id='be-u-el2-c1b-s13' d='M308.106452,324.320033c10.886491-3.290854,34.283724-7.211282,46.742465-8.171768l-.298927-49.138268-45.968805.55-.474733,56.760036Z' transform='scale(-1,-1) translate(-173,-390)' fill='var(--c1b)' stroke='#000'/></g><g transform='translate(469.56559,377.879997)' style='animation:be-u-el1-c1b-s13_to__to 20000ms linear 999 normal forwards'><path id='be-u-el1-c1b-s13' d='M307.824213,315.000309c11.448642-.633335,34.891408-4.682185,46.9059-8.171766l-.180123-39.818546-45.968805.55-.756972,47.440312Z' transform='translate(-490,-206)' fill='var(--c1b)' stroke='#000'/></g></g><clipPath id='be-u-clipping-paths28'><path id='be-u-c-eye-b-r-eyelids-cp2' d='M321.09,500.19c-7.4,8.95-16.58,7.69-20.66-2.67-.08-.2-.16-.39-.23-.6-.56-1.54-.98-3.19-1.27-4.91-1.78-10.46,1.22-23.55,7.6-31.26.97-1.18,1.98-2.17,3-2.99c6.8-5.45,14.36-3.12,17.89,6.25c4.06,10.78,1.21,27.06-6.33,36.17Z' stroke-width='1.01'/></clipPath></g></g><g id='be-u-c-eye-b-l2' transform='translate(-43.333331 43.30303)'><path id='be-s-path245' d='M476.19,410.4c-7.4,8.95-16.58,7.69-20.66-2.67-.08-.2-.16-.39-.23-.6-.56-1.54-.98-3.19-1.27-4.91-1.78-10.46,1.22-23.55,7.6-31.26.97-1.18,1.98-2.17,3-2.99c6.8-5.45,14.36-3.12,17.89,6.25c4.06,10.78,1.21,27.06-6.33,36.17Z' fill='none' stroke='#000' stroke-width='1.01'/><g id='be-u-clip-group28' clip-path='url(#be-u-clipping-paths29)'><g id='be-u-c-eye-b-eyelids2' transform='translate(0 0.000001)'><g transform='translate(469.56559,377.879997)' style='animation:be-u-el1-c1b-s14_to__to 20000ms linear 999 normal forwards'><path id='be-u-el1-c1b-s14' d='M308.581186,328.749997l45.488805-26.03.479999-35.71-45.968805.55.000001,61.19Z' transform='translate(-331.565587,-297.879997)' fill='var(--c1b)' stroke='#000'/></g><g transform='translate(469.56559,412.879997)' style='animation:be-u-el2-c1b-s14_to__to 20000ms linear 999 normal forwards'><path id='be-u-el2-c1b-s14' d='M309.039444,329.560324c11.507922-7.404259,34.070531-19.276951,46.415595-21.989467l-.905049-40.56086-45.968805.55.458259,62.000327Z' transform='scale(-1,-1) translate(-331.565587,-297.879997)' fill='var(--c1b)' stroke='#000'/></g></g><clipPath id='be-u-clipping-paths29'><path id='be-u-c-eye-b-eyelids-cp2' d='M476.19,410.4c-7.4,8.95-16.58,7.69-20.66-2.67-.08-.2-.16-.39-.23-.6-.56-1.54-.98-3.19-1.27-4.91-1.78-10.46,1.22-23.55,7.6-31.26.97-1.18,1.98-2.17,3-2.99c6.8-5.45,14.36-3.12,17.89,6.25c4.06,10.78,1.21,27.06-6.33,36.17Z' stroke-width='1.01'/></clipPath></g></g></g></g></g>";

  function getAssetFromID(uint assetID) external pure returns (string memory) {
    if (assetID == 5020) {
      return C_EYE_K;
    } else if (assetID == 5022) {
      return C_EYE_L;
    } else if (assetID == 5024) {
      return C_EYE_M;
    } else {
      return "";
    }
  }

  function getProductivityFromID(uint assetID) external pure returns (uint) {
    if (assetID == 5020) {
      return 2;
    } else if (assetID == 5022) {
      return 2;
    } else if (assetID == 5024) {
      return 4;
    } else {
      return 0;
    }
  }
}