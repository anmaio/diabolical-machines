// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "./Additional/ConveyorAdditional5.sol";
import "./Additional/ConveyorAdditional6.sol";
import "./Additional/ConveyorAdditional7.sol";
import "./Additional/ConveyorAdditional8.sol";

contract ConveyorImp4 {

  string internal constant CB_U_F_P5F3_REV_PL = "<g id='cb-u-f-p5f3-rev-pl' clip-path='url(#cb-u-clipping-paths16)'><g style='offset-path:path(&quot;M310,821L305.551948,811.603896L542.142857,680.285714C637.97215,603.313207,616.181518,696.611874,615.333569,799.131794Q613.431157,696.721497,614.123657,798.556787L310,821L542.142857,680.285714C638.091203,602.622915,615.348694,694.709317,615.348694,797.962926Q614.062221,697.315583,614.754721,799.150873L310,821L542.142857,680.285714C635.266662,602.268107,613.599003,696.501917,615.349065,798.005464Q614.454939,696.736127,615.147439,798.571417L310,821L542.142857,680.285714C638.56692,603.741918,615.045152,695.704321,614.607637,798.082899Q614.010483,697.363606,614.702983,799.198896L310,821L542.142857,680.285714C635.864171,602.022864,614.779158,695.817194,615.654189,798.633287&quot;);offset-rotate:0deg;animation:cb-u-floob-p5f3-rev-pl_to__to 20000ms linear 999 normal forwards'><g style='animation:cb-u-floob-p5f3-rev-pl_ts__ts 20000ms linear 999 normal forwards' transform='scale(1,1)'><g opacity='0' style='animation:cb-u-floob-p5f3-rev-pl_c_o 20000ms linear 999 normal forwards' transform='translate(-671.27 -479.23)'><path id='cb-u-polygon-g0-s110' fill='var(--g0)' stroke='#000' d='M676.02 480.22 728.01 510.27 727.99 459.26 676.02 429.29 676.02 480.22 676.02 480.22z'/><path id='cb-u-polygon-g0-s111' fill='var(--g0)' stroke='#000' d='M624.04 510.18 676.04 540.23 676.01 489.22 624.04 459.25 624.04 510.18 624.04 510.18z'/><path id='cb-u-polygon-g1-s14' fill='var(--g1)' stroke='#000' d='M676.01 489.22 676.04 540.23 728.01 510.27 727.99 459.26 676.01 489.22z'/><path id='cb-u-polygon-g0-s112' fill='var(--g0)' stroke='#000' d='M676.02 429.29 624.04 459.25 676.01 489.22 727.99 459.26 676.02 429.29z'/><path id='cb-s-polyline4' fill='none' stroke='#fff' stroke-width='3' d='M673.53 490.56 627.06 464.2 626.87 490.94'/><path id='cb-s-line222' fill='none' stroke='#fff' stroke-width='3' d='M629.9 459.27 675.61 433.28'/></g></g></g><clipPath id='cb-u-clipping-paths16'><path id='cb-u-floob-reverse-p5to3-cp2' fill='none' stroke='#3f5787' stroke-width='2.16' d='M392.760252,690.42352l74.784327,43.048718c63.379547-35.14405,207.332705-122.124082,193.596398-110.778195l12.140475,23.158768c38.197868,99.342009-18.964294,109.572916-45.44131,113.145212l-51.530018-30.062519C516.603232,780.037028,423.568614,843.696913,317.67,929.204966L186.757357,853.176193L392.760252,690.42352Z' transform='translate(.000001 0.000003)'/></clipPath></g>";
  string internal constant CB_U_F_P4F3_REV_PL = "<g id='cb-u-f-p4f3-rev-pl' clip-path='url(#cb-u-clipping-paths17)'><g transform='translate(0-2)'><g style='offset-path:path(&quot;M474.545454,717.805195L542.142857,680.285714C629.333737,624.51658,611.37,651.065005,612.0625,752.900295C566.312729,791.218707,533.178121,1000.539248,474.545454,717.805195L542.142857,680.285714C629.333737,624.51658,611.37,651.065005,612.0625,752.900295C562.93256,776.024904,548.261695,1015.9346,474.545454,717.805195L542.142857,680.285714C629.333737,624.51658,611.37,651.065005,612.0625,752.900295C567.594974,793.56482,535.430206,997.409487,474.545454,717.805195L542.142857,680.285714C629.333737,624.51658,611.37,651.065005,612.0625,752.900295Q535.430206,997.409487,474.545454,717.805195L542.142857,680.285714C629.333737,624.51658,611.37,651.065005,612.0625,752.900295&quot;);offset-rotate:0deg;animation:cb-u-floob-reverse-p4to3_to__to 20000ms linear 999 normal forwards'><g style='animation:cb-u-floob-reverse-p4to3_ts__ts 20000ms linear 999 normal forwards' transform='scale(1,1)'><g opacity='0' style='animation:cb-u-floob-reverse-p4to3_c_o 20000ms linear 999 normal forwards' transform='translate(-672 -476)'><path id='cb-u-polygon-g0-s113' fill='var(--g0)' stroke='#000' d='M676.02 480.22 728.01 510.27 727.99 459.26 676.02 429.29 676.02 480.22 676.02 480.22z'/><path id='cb-u-polygon-g0-s114' fill='var(--g0)' stroke='#000' d='M624.04 510.18 676.04 540.23 676.01 489.22 624.04 459.25 624.04 510.18 624.04 510.18z'/><path id='cb-u-polygon-g1-s15' fill='var(--g1)' stroke='#000' d='M676.01 489.22 676.04 540.23 728.01 510.27 727.99 459.26 676.01 489.22z'/><path id='cb-u-polygon-g0-s115' fill='var(--g0)' stroke='#000' d='M676.02 429.29 624.04 459.25 676.01 489.22 727.99 459.26 676.02 429.29z'/><path id='cb-s-polyline5' fill='none' stroke='#fff' stroke-width='3' d='M673.53 490.56 627.06 464.2 626.87 490.94'/><path id='cb-s-line223' fill='none' stroke='#fff' stroke-width='3' d='M629.9 459.27 675.61 433.28'/></g></g></g><clipPath id='cb-u-clipping-paths17' transform='translate(-16 7)'><path id='cb-u-floob-reverse-p4to3-cp3' fill='none' stroke='#3f5787' stroke-width='2.16' d='M449.340001,549.669998l23.286253-7.396694c0,0,167.63602,96.016876,167.63602,96.016876s38.549249-22.565588,41.712249-24.397731c11.192726-6.483308,14.089141,69.036632,14.166424,69.258074c15.601079,44.702571-14.788377,66.500035-50.533221,70.471953-1.791681.258961-55.425302-31.092242-55.425302-31.092242L396.120687,834.773535L238.075011,731.2l211.26499-181.530002Z' transform='translate(.000001 0.000003)'/></clipPath></g></g>";
  string internal constant CB_U_F_P4F3_REV = "<g id='cb-u-f-p4f3-rev' clip-path='url(#cb-u-clipping-paths18)'><g style='offset-path:path(&quot;M458.333921,711.248868L538.106864,662.203281C625.297744,606.434147,634.70638,659.858502,635.39888,761.693792C589.649109,800.012204,516.966588,993.982921,458.333921,711.248868L537.515953,661.61237C622.400543,607.318388,635.223094,665.188806,634.577123,760.46686C635.015265,763.036345,635.440561,759.095844,635.458878,761.789493C586.328938,784.914102,532.641073,1010.560094,458.924832,712.430689L537.515953,662.839673C624.706833,607.070539,634.3255,659.513326,635.018,761.348616C590.550474,802.013141,518.627762,991.44407,457.74301,711.839778L538.697774,662.203281C629.655993,610.543971,650.468647,676.683155,635.018,760.907738Q518.627762,990.85316,457.74301,711.248868L538.106864,661.61237C625.297744,605.843236,634.3255,659.072448,635.018,760.907738&quot;);offset-rotate:0deg;animation:cb-u-floob-reverse-p4to32_to__to 20000ms linear 999 normal forwards'><g style='animation:cb-u-floob-reverse-p4to32_ts__ts 20000ms linear 999 normal forwards' transform='scale(1,1)'><g opacity='0' style='animation:cb-u-floob-reverse-p4to32_c_o 20000ms linear 999 normal forwards' transform='translate(-665.72 -446.13)'><path id='cb-u-polygon-g0-s116' fill='var(--g0)' stroke='#000' d='M676.02 480.22 728.01 510.27 727.99 459.26 676.02 429.29 676.02 480.22 676.02 480.22z'/><path id='cb-u-polygon-g0-s117' fill='var(--g0)' stroke='#000' d='M624.04 510.18 676.04 540.23 676.01 489.22 624.04 459.25 624.04 510.18 624.04 510.18z'/><path id='cb-u-polygon-g1-s16' fill='var(--g1)' stroke='#000' d='M676.01 489.22 676.04 540.23 728.01 510.27 727.99 459.26 676.01 489.22z'/><path id='cb-u-polygon-g0-s118' fill='var(--g0)' stroke='#000' d='M676.02 429.29 624.04 459.25 676.01 489.22 727.99 459.26 676.02 429.29z'/><path id='cb-s-polyline6' fill='none' stroke='#fff' stroke-width='3' d='M673.53 490.56 627.06 464.2 626.87 490.94'/><path id='cb-s-line224' fill='none' stroke='#fff' stroke-width='3' d='M629.9 459.27 675.61 433.28'/></g></g></g><clipPath id='cb-u-clipping-paths18'><path id='cb-u-floob-reverse-p4to3-cp4' fill='none' stroke='#3f5787' stroke-width='2.16' d='M449.340001,549.669998l-4.449982,26.750003c.717917,4.768272,132.3528,79.033995,164.967158,97.959998c4.687256,2.719999,8.885267,2.533027,12.048267.700881c11.192726-6.483311,36.410099-20.934744,36.644555-20.940881c48.534008-1.270324,38.194922,39.177522,28.938556,72.554401-5.956957,21.479773-55.429498,28.424045-64.775792,23.404403-1.616804-1.461815-31.699348-17.812647-31.0764-18.435595L459.763929,853.11745L238.075011,731.2l211.26499-181.530002Z' transform='translate(1 0)'/></clipPath></g>";
  string internal constant CB_U_SHAD_WALL = "<g id='cb-u-shad-wall'><g transform='translate(3-2)'><path id='cb-s-path206' fill='#1d1d1b' d='M780.75,720.38l-.15-180.42-157.11-89.04.85,179.3c0,0,.03.03.08.08l-.34.2l156.3,90.11.38-.22Z' opacity='0.3' style='mix-blend-mode:multiply'/></g></g>";
  string internal constant CB_U_SHAD_P3 = "<g id='cb-u-shad-p3'><g transform='translate(4-2)'><path id='cb-s-polygon17' fill='#1d1d1b' d='M624.06 630.5 468.63 720.13 624.47 810.35 780.36 720.6 624.06 630.5z' opacity='0.3' style='mix-blend-mode:multiply'/></g></g>";
  string internal CB_U_CONV_P3 = string.concat(ConveyorAdditional5.getPart(), ConveyorAdditional6.getPart());
  string internal constant CB_U_SHAD_P4 = "<g id='cb-u-shad-p4'><g transform='translate(-153 87)'><path id='cb-s-polygon18' fill='#1d1d1b' d='M624.06 630.5 468.63 720.13 624.47 810.35 780.36 720.6 624.06 630.5z' opacity='0.3' style='mix-blend-mode:multiply'/></g></g>";
  string internal CB_U_CONV_P4 = string.concat(ConveyorAdditional7.getPart(), ConveyorAdditional8.getPart());

  function getAssetFromID(uint assetID) external view returns (string memory) {
    if (assetID == 12018) {
      return CB_U_F_P5F3_REV_PL;
    } else if (assetID == 12019) {
      return CB_U_F_P4F3_REV_PL;
    } else if (assetID == 12020) {
      return CB_U_F_P4F3_REV;
    } else if (assetID == 12021) {
      return CB_U_SHAD_WALL;
    } else if (assetID == 12022) {
      return CB_U_SHAD_P3;
    } else if (assetID == 12023) {
      return CB_U_CONV_P3;
    } else if (assetID == 12024) {
      return CB_U_SHAD_P4;
    } else if (assetID == 12025) {
      return CB_U_CONV_P4;
    } else {
      return "";
    }
  }

  function getProductivityFromID(uint assetID) external pure returns (uint) {
    if (assetID == 12018) {
      return 5;
    } else if (assetID == 12019) {
      return 4;
    } else if (assetID == 12020) {
      return 2;
    } else if (assetID == 12021) {
      return 1;
    } else if (assetID == 12022) {
      return 3;
    } else if (assetID == 12023) {
      return 3;
    } else if (assetID == 12024) {
      return 1;
    } else if (assetID == 12025) {
      return 3;
    } else {
      return 0;
    }
  }
}