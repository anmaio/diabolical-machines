// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "./Additional/ConveyorAdditional1.sol";
import "./Additional/ConveyorAdditional2.sol";
import "./Additional/ConveyorAdditional3.sol";
import "./Additional/ConveyorAdditional4.sol";

contract ConveyorImp2 {

  string internal constant CB_U_SHAD_P4_PL = "<g id='cb-u-shad-p4-pl'><g transform='translate(-153 89)'><path id='cb-s-polygon13' fill='#1d1d1b' d='M624.06 630.5 468.63 720.13 624.47 810.35 780.36 720.6 624.06 630.5z' opacity='0.3' style='mix-blend-mode:multiply'/></g></g>";
  string internal constant CB_U_PLAT_P4_REV = "<g id='cb-u-plat-p4-rev'><g transform='translate(-149 221)'><g id='cb-u-plat' transform='translate(.442793 0.292558)'><path id='cb-u-polygon-c1b-s1' fill='var(--c1b)' stroke='#000' d='M780.15 540.31 780.16 552.93 623.89 643.19 623.88 630.28 780.15 540.31z'/><g id='cb-s-g164'><path id='cb-u-polygon-c1b-s12' fill='var(--c1b)' stroke='#000' d='M623.88 450.13 468.04 540.06 481.04 547.59 636.84 457.55 623.88 450.13z'/><path id='cb-u-polygon-c0b-s13' fill='var(--c0b)' stroke='#000' d='M636.84 457.55 481.04 547.59 610.96 622.8 766.92 532.67 636.84 457.55z'/><path id='cb-u-polygon-c1b-s13' fill='var(--c1b)' stroke='#000' d='M780.15 540.31 766.92 532.67 610.96 622.8 623.88 630.28 780.15 540.31z'/></g><g id='cb-s-g165'><g id='cb-s-g166'><path id='cb-u-polygon-c0b-s14' fill='var(--c0b)' stroke='#000' d='M481.06 547.6 481.04 560.69 610.96 635.72 610.96 622.8 481.06 547.6z'/><path id='cb-u-polygon-c1b-s14' fill='var(--c1b)' stroke='#000' d='M468.04 540.06 468.04 553.18 481.04 560.69 481.06 547.6 468.04 540.06z'/></g><path id='cb-u-polygon-c1b-s15' fill='var(--c1b)' stroke='#000' d='M623.89 643.19 623.88 630.28 610.96 622.8 610.96 635.72 623.89 643.19z'/></g><g id='cb-u-detail-9-c1-s1'><g id='cb-u-clip-group11' clip-path='url(#cb-u-clipping-paths11)'><g id='cb-u-ld4g'><g style='animation:cb-u-ld4_to__to 20000ms linear 999 normal forwards' transform='translate(-1553.9 1788.75)'><g id='cb-u-ld4' transform='translate(-858.1 -406.75)'><g id='cb-u-gr'><g id='cb-u-linesd2' transform='translate(137-78.999999)'><g id='cb-u-lines' transform='translate(0 0)'><path id='cb-s-line27' fill='none' stroke='#fff' d='M634.23 607.23 508.87 534.26'/><path id='cb-s-line28' fill='none' stroke='#fff' d='M660.57 591.49 535.21 518.51'/><path id='cb-s-line29' fill='none' stroke='#fff' d='M688.73 576.05 563.37 503.07'/><path id='cb-s-line30' fill='none' stroke='#fff' d='M716.89 559.39 591.53 486.41'/><path id='cb-s-line31' fill='none' stroke='#fff' d='M742.33 544.25 616.97 471.27'/><path id='cb-s-line32' fill='none' stroke='#fff' d='M742.33 544.25 616.97 471.27' transform='translate(29-15)'/></g><g id='cb-u-lines2' transform='translate(-163 94)'><path id='cb-s-line33' fill='none' stroke='#fff' d='M634.23 607.23 508.87 534.26'/><path id='cb-s-line34' fill='none' stroke='#fff' d='M660.57 591.49 535.21 518.51'/><path id='cb-s-line35' fill='none' stroke='#fff' d='M688.73 576.05 563.37 503.07'/><path id='cb-s-line36' fill='none' stroke='#fff' d='M716.89 559.39 591.53 486.41'/><path id='cb-s-line37' fill='none' stroke='#fff' d='M742.33 544.25 616.97 471.27'/><path id='cb-s-line38' fill='none' stroke='#fff' d='M742.33 544.25 616.97 471.27' transform='translate(29-15)'/></g></g><g id='cb-u-linesd22' transform='translate(462-264.999999)'><g id='cb-u-lines3' transform='translate(0 0)'><path id='cb-s-line39' fill='none' stroke='#fff' d='M634.23 607.23 508.87 534.26'/><path id='cb-s-line40' fill='none' stroke='#fff' d='M660.57 591.49 535.21 518.51'/><path id='cb-s-line41' fill='none' stroke='#fff' d='M688.73 576.05 563.37 503.07'/><path id='cb-s-line42' fill='none' stroke='#fff' d='M716.89 559.39 591.53 486.41'/><path id='cb-s-line43' fill='none' stroke='#fff' d='M742.33 544.25 616.97 471.27'/><path id='cb-s-line44' fill='none' stroke='#fff' d='M742.33 544.25 616.97 471.27' transform='translate(29-15)'/></g><g id='cb-u-lines4' transform='translate(-163 94)'><path id='cb-s-line45' fill='none' stroke='#fff' d='M634.23 607.23 508.87 534.26'/><path id='cb-s-line46' fill='none' stroke='#fff' d='M660.57 591.49 535.21 518.51'/><path id='cb-s-line47' fill='none' stroke='#fff' d='M688.73 576.05 563.37 503.07'/><path id='cb-s-line48' fill='none' stroke='#fff' d='M716.89 559.39 591.53 486.41'/><path id='cb-s-line49' fill='none' stroke='#fff' d='M742.33 544.25 616.97 471.27'/><path id='cb-s-line50' fill='none' stroke='#fff' d='M742.33 544.25 616.97 471.27' transform='translate(29-15)'/></g></g></g><g id='cb-u-gr2' transform='translate(651-373)'><g id='cb-u-linesd23' transform='translate(137-78.999999)'><g id='cb-u-lines5' transform='translate(0 0)'><path id='cb-s-line51' fill='none' stroke='#fff' d='M634.23 607.23 508.87 534.26'/><path id='cb-s-line52' fill='none' stroke='#fff' d='M660.57 591.49 535.21 518.51'/><path id='cb-s-line53' fill='none' stroke='#fff' d='M688.73 576.05 563.37 503.07'/><path id='cb-s-line54' fill='none' stroke='#fff' d='M716.89 559.39 591.53 486.41'/><path id='cb-s-line55' fill='none' stroke='#fff' d='M742.33 544.25 616.97 471.27'/><path id='cb-s-line56' fill='none' stroke='#fff' d='M742.33 544.25 616.97 471.27' transform='translate(29-15)'/></g><g id='cb-u-lines6' transform='translate(-163 94)'><path id='cb-s-line57' fill='none' stroke='#fff' d='M634.23 607.23 508.87 534.26'/><path id='cb-s-line58' fill='none' stroke='#fff' d='M660.57 591.49 535.21 518.51'/><path id='cb-s-line59' fill='none' stroke='#fff' d='M688.73 576.05 563.37 503.07'/><path id='cb-s-line60' fill='none' stroke='#fff' d='M716.89 559.39 591.53 486.41'/><path id='cb-s-line61' fill='none' stroke='#fff' d='M742.33 544.25 616.97 471.27'/><path id='cb-s-line62' fill='none' stroke='#fff' d='M742.33 544.25 616.97 471.27' transform='translate(29-15)'/></g></g><g id='cb-u-linesd24' transform='translate(462-264.999999)'><g id='cb-u-lines7' transform='translate(0 0)'><path id='cb-s-line63' fill='none' stroke='#fff' d='M634.23 607.23 508.87 534.26'/><path id='cb-s-line64' fill='none' stroke='#fff' d='M660.57 591.49 535.21 518.51'/><path id='cb-s-line65' fill='none' stroke='#fff' d='M688.73 576.05 563.37 503.07'/><path id='cb-s-line66' fill='none' stroke='#fff' d='M716.89 559.39 591.53 486.41'/><path id='cb-s-line67' fill='none' stroke='#fff' d='M742.33 544.25 616.97 471.27'/><path id='cb-s-line68' fill='none' stroke='#fff' d='M742.33 544.25 616.97 471.27' transform='translate(29-15)'/></g><g id='cb-u-lines8' transform='translate(-163 94)'><path id='cb-s-line69' fill='none' stroke='#fff' d='M634.23 607.23 508.87 534.26'/><path id='cb-s-line70' fill='none' stroke='#fff' d='M660.57 591.49 535.21 518.51'/><path id='cb-s-line71' fill='none' stroke='#fff' d='M688.73 576.05 563.37 503.07'/><path id='cb-s-line72' fill='none' stroke='#fff' d='M716.89 559.39 591.53 486.41'/><path id='cb-s-line73' fill='none' stroke='#fff' d='M742.33 544.25 616.97 471.27'/><path id='cb-s-line74' fill='none' stroke='#fff' d='M742.33 544.25 616.97 471.27' transform='translate(29-15)'/></g></g></g><g id='cb-u-gr3' transform='translate(1301-745)'><g id='cb-u-linesd25' transform='translate(137-78.999999)'><g id='cb-u-lines9' transform='translate(0 0)'><path id='cb-s-line75' fill='none' stroke='#fff' d='M634.23 607.23 508.87 534.26'/><path id='cb-s-line76' fill='none' stroke='#fff' d='M660.57 591.49 535.21 518.51'/><path id='cb-s-line77' fill='none' stroke='#fff' d='M688.73 576.05 563.37 503.07'/><path id='cb-s-line78' fill='none' stroke='#fff' d='M716.89 559.39 591.53 486.41'/><path id='cb-s-line79' fill='none' stroke='#fff' d='M742.33 544.25 616.97 471.27'/><path id='cb-s-line80' fill='none' stroke='#fff' d='M742.33 544.25 616.97 471.27' transform='translate(29-15)'/></g><g id='cb-u-lines10' transform='translate(-163 94)'><path id='cb-s-line81' fill='none' stroke='#fff' d='M634.23 607.23 508.87 534.26'/><path id='cb-s-line82' fill='none' stroke='#fff' d='M660.57 591.49 535.21 518.51'/><path id='cb-s-line83' fill='none' stroke='#fff' d='M688.73 576.05 563.37 503.07'/><path id='cb-s-line84' fill='none' stroke='#fff' d='M716.89 559.39 591.53 486.41'/><path id='cb-s-line85' fill='none' stroke='#fff' d='M742.33 544.25 616.97 471.27'/><path id='cb-s-line86' fill='none' stroke='#fff' d='M742.33 544.25 616.97 471.27' transform='translate(29-15)'/></g></g><g id='cb-u-linesd26' transform='translate(462-264.999999)'><g id='cb-u-lines11' transform='translate(0 0)'><path id='cb-s-line87' fill='none' stroke='#fff' d='M634.23 607.23 508.87 534.26'/><path id='cb-s-line88' fill='none' stroke='#fff' d='M660.57 591.49 535.21 518.51'/><path id='cb-s-line89' fill='none' stroke='#fff' d='M688.73 576.05 563.37 503.07'/><path id='cb-s-line90' fill='none' stroke='#fff' d='M716.89 559.39 591.53 486.41'/><path id='cb-s-line91' fill='none' stroke='#fff' d='M742.33 544.25 616.97 471.27'/><path id='cb-s-line92' fill='none' stroke='#fff' d='M742.33 544.25 616.97 471.27' transform='translate(29-15)'/></g><g id='cb-u-lines12' transform='translate(-163 94)'><path id='cb-s-line93' fill='none' stroke='#fff' d='M634.23 607.23 508.87 534.26'/><path id='cb-s-line94' fill='none' stroke='#fff' d='M660.57 591.49 535.21 518.51'/><path id='cb-s-line95' fill='none' stroke='#fff' d='M688.73 576.05 563.37 503.07'/><path id='cb-s-line96' fill='none' stroke='#fff' d='M716.89 559.39 591.53 486.41'/><path id='cb-s-line97' fill='none' stroke='#fff' d='M742.33 544.25 616.97 471.27'/><path id='cb-s-line98' fill='none' stroke='#fff' d='M742.33 544.25 616.97 471.27' transform='translate(29-15)'/></g></g></g><g id='cb-u-gr4' transform='translate(1951-1119)'><g id='cb-u-linesd27' transform='translate(137-78.999999)'><g id='cb-u-lines13' transform='translate(0 0)'><path id='cb-s-line99' fill='none' stroke='#fff' d='M634.23 607.23 508.87 534.26'/><path id='cb-s-line100' fill='none' stroke='#fff' d='M660.57 591.49 535.21 518.51'/><path id='cb-s-line101' fill='none' stroke='#fff' d='M688.73 576.05 563.37 503.07'/><path id='cb-s-line102' fill='none' stroke='#fff' d='M716.89 559.39 591.53 486.41'/><path id='cb-s-line103' fill='none' stroke='#fff' d='M742.33 544.25 616.97 471.27'/><path id='cb-s-line104' fill='none' stroke='#fff' d='M742.33 544.25 616.97 471.27' transform='translate(29-15)'/></g><g id='cb-u-lines14' transform='translate(-163 94)'><path id='cb-s-line105' fill='none' stroke='#fff' d='M634.23 607.23 508.87 534.26'/><path id='cb-s-line106' fill='none' stroke='#fff' d='M660.57 591.49 535.21 518.51'/><path id='cb-s-line107' fill='none' stroke='#fff' d='M688.73 576.05 563.37 503.07'/><path id='cb-s-line108' fill='none' stroke='#fff' d='M716.89 559.39 591.53 486.41'/><path id='cb-s-line109' fill='none' stroke='#fff' d='M742.33 544.25 616.97 471.27'/><path id='cb-s-line110' fill='none' stroke='#fff' d='M742.33 544.25 616.97 471.27' transform='translate(29-15)'/></g></g><g id='cb-u-linesd28' transform='translate(462-264.999999)'><g id='cb-u-lines15' transform='translate(0 0)'><path id='cb-s-line111' fill='none' stroke='#fff' d='M634.23 607.23 508.87 534.26'/><path id='cb-s-line112' fill='none' stroke='#fff' d='M660.57 591.49 535.21 518.51'/><path id='cb-s-line113' fill='none' stroke='#fff' d='M688.73 576.05 563.37 503.07'/><path id='cb-s-line114' fill='none' stroke='#fff' d='M716.89 559.39 591.53 486.41'/><path id='cb-s-line115' fill='none' stroke='#fff' d='M742.33 544.25 616.97 471.27'/><path id='cb-s-line116' fill='none' stroke='#fff' d='M742.33 544.25 616.97 471.27' transform='translate(29-15)'/></g><g id='cb-u-lines16' transform='translate(-163 94)'><path id='cb-s-line117' fill='none' stroke='#fff' d='M634.23 607.23 508.87 534.26'/><path id='cb-s-line118' fill='none' stroke='#fff' d='M660.57 591.49 535.21 518.51'/><path id='cb-s-line119' fill='none' stroke='#fff' d='M688.73 576.05 563.37 503.07'/><path id='cb-s-line120' fill='none' stroke='#fff' d='M716.89 559.39 591.53 486.41'/><path id='cb-s-line121' fill='none' stroke='#fff' d='M742.33 544.25 616.97 471.27'/><path id='cb-s-line122' fill='none' stroke='#fff' d='M742.33 544.25 616.97 471.27' transform='translate(29-15)'/></g></g></g></g></g></g><clipPath id='cb-u-clipping-paths11'><path id='cb-u-platformclippath3' fill='var(--c1b)' stroke='#000' d='M636.84 457.55 481.04 547.59 610.96 622.8 766.92 532.67 636.84 457.55z'/></clipPath></g><ellipse id='cb-s-ellipse9' fill='var(--c1b)' stroke='#d8d8d8' stroke-width='0.5' rx='2.89' ry='2.59' transform='matrix(.295708-.955278 0.955278 0.295708 631.321881 632.566556)'/><ellipse id='cb-s-ellipse10' fill='var(--c1b)' stroke='#d8d8d8' stroke-width='0.5' rx='2.89' ry='2.59' transform='matrix(.295708-.955278 0.955278 0.295708 665.162839 613.175709)'/><ellipse id='cb-s-ellipse11' fill='var(--c1b)' stroke='#d8d8d8' stroke-width='0.5' rx='2.89' ry='2.59' transform='matrix(.295708-.955278 0.955278 0.295708 698.984244 593.781906)'/><ellipse id='cb-s-ellipse12' fill='var(--c1b)' stroke='#d8d8d8' stroke-width='0.5' rx='2.89' ry='2.59' transform='matrix(.295708-.955278 0.955278 0.295708 732.815649 574.378102)'/><ellipse id='cb-s-ellipse13' fill='var(--c1b)' stroke='#d8d8d8' stroke-width='0.5' rx='2.89' ry='2.59' transform='matrix(.295708-.955278 0.955278 0.295708 766.646607 554.987255)'/></g></g></g></g>";


  function getAssetFromID(uint assetID) external pure returns (string memory) {
    if (assetID == 12010) {
      return string.concat(ConveyorAdditional1.getPart(), ConveyorAdditional2.getPart());
    } else if (assetID == 12011) {
      return string.concat(ConveyorAdditional3.getPart(), ConveyorAdditional4.getPart());
    } else if (assetID == 12012) {
      return CB_U_SHAD_P4_PL;
    } else if (assetID == 12013) {
      return CB_U_PLAT_P4_REV;
    } else {
      return "";
    }
  }

  function getProductivityFromID(uint assetID) external pure returns (uint) {
    if (assetID == 12010) {
      return 4;
    } else if (assetID == 12011) {
      return 5;
    } else if (assetID == 12012) {
      return 1;
    } else if (assetID == 12013) {
      return 4;
    } else {
      return 0;
    }
  }
}