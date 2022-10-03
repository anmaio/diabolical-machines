// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

contract SharedAssets {
    mapping(string => string) internal objectToSVG;

    // opening svg start tag and grid
    string internal constant SVG_START =
        "<svg xmlns='http://www.w3.org/2000/svg' shape-rendering='geometricPrecision' text-rendering='geometricPrecision' width='846' height='846'> <path d='M0 178.92 423 0m0 0 423 181.128m0 0v481.536m0 0L423 846m0 0L0 662.664m0-.001V178.92M423 0v474.908m0 .001 423 187.754M423 474.909 0 662.663M141.369 119.28l2.208 479.326M280.527 59.64v479.326M561.055 57.43v481.536M702.423 119.28l2.208 479.326M141.368 724.512l419.686-185.546M280.527 786.36l421.896-187.754m-561.055 0L561.054 786.36M280.527 538.966l421.896 185.546M0 342.376 423 159.04m0 0 423 183.336M0 501.415l423-183.336m0 0 423 183.336' fill='none' stroke='#3f5787' stroke-width='3'/>";

    // Floor Altar
    string internal constant ALTAR =
        "<svg id='eoZwGJvVKy01' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' viewBox='0 0 282 423' shape-rendering='geometricPrecision' text-rendering='geometricPrecision' width='282' height='423'> <rect width='140.686' height='160.144542' rx='0' ry='0' transform='matrix(1 0.445229 0 1 2 200.616985)' fill='#fff' stroke='#000' />  <rect width='171.065595' height='115' rx='0' ry='0' transform='matrix(.8-.373046 0-1.4 143 425.090187)' fill='#f6f6f6' stroke='#000' /> <path d='M0,200.616984l142.686,62.63744l137.166476-62.63744L141,138.490156L0,200.616984Z' transform='translate(1 0.000004)' fill='#e4e4e4' stroke='#3f5787' stroke-width='0.846' /> <g transform='matrix(.43788 0 0 0.42068 79.655337 49.756824)'>  <path d='M0,200.616984l142.686,62.63744l137.166476-62.63744L141,138.490156L0,200.616984Z' transform='translate(0 0.000004)' fill='#e4e4e4' stroke='#3f5787' stroke-width='0.846' /> <rect width='140.686' height='160.144542' rx='0' ry='0' transform='matrix(1 0.445229 0 1 2 200.616985)' fill='#fff' stroke='#000' />  <rect width='171.065595' height='115' rx='0' ry='0' transform='matrix(.8-.373046 0-1.4 143 423.090187)' fill='#f6f6f6' stroke='#000' /> </g>  </svg>";

    // Floor Props
    string internal constant PROPS =
        "<svg id='e9UvlsByGqL1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' viewBox='0 0 282 423' shape-rendering='geometricPrecision' text-rendering='geometricPrecision' width='282' height='423'> <rect width='140.686' height='86' rx='0' ry='0' transform='matrix(1 0.445229 0 1 2 274.616985)' fill='#fff' stroke='#000' />  <rect width='171.065595' height='61.428571' rx='0' ry='0' transform='matrix(.8-.373046 0-1.4 143 423.090187)' fill='#f6f6f6' stroke='#000' /> <path d='M0,200.616984l142.686,62.63744l137.166476-62.63744L141,138.490156L0,200.616984Z' transform='translate(1 74.000004)' fill='#adf8ff' stroke='#3f5787' stroke-width='0.846' />  <g transform='matrix(.43788 0 0 0.42068 79.655337 49.756824)'>  <rect width='140.686' height='160.144542' rx='0' ry='0' transform='matrix(1 0.445229 0 1 2 369.391348)' fill='#fff' stroke='#000' />  <rect width='171.065595' height='115' rx='0' ry='0' transform='matrix(.8-.373046 0-1.4 143 591.86455)' fill='#f6f6f6' stroke='#000' />  <path d='M0,200.616984l142.686,62.63744l137.166476-62.63744L141,138.490156L0,200.616984Z' transform='translate(0 166.397263)' fill='#f68d8d' stroke='#3f5787' stroke-width='0.846' /> </g>  </svg>";

    string internal constant LEFT_FRAME =
        "<svg id='ew0OCjZM6VQ1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' viewBox='0 0 282 282' shape-rendering='geometricPrecision' text-rendering='geometricPrecision' width='282' height='282'>  <rect width='174.579991' height='66.410726' rx='0' ry='0' transform='matrix(.77969-.34714 0 1.415434 3.043553 95.297099)' fill='#fff' stroke='#000' stroke-linecap='round' /> <rect width='174.579991' height='66.410726' rx='0' ry='0' transform='matrix(.77969-.34714 0 1.415434 17.043553 101.297099)' fill='#fff' stroke='#000' stroke-linecap='round' /> <rect width='180.022193' height='63.114754' rx='0' ry='0' transform='matrix(.68-.302756 0 1.22 24.755739 106.955149)' fill='#e3e3e3' stroke='#000' stroke-linecap='round' />  <path d='M153.161826,40.693339l-14-6.743522L3.043553,95.297099l13.999999,6l136.118274-60.60376Z' transform='translate(.000002 0)' fill='#fff' stroke='#3f5787' stroke-width='0.564' />  <path d='M3.043553,189.886992l14.000001,5.914859-.000001-94.504753-14-6.000001v94.589895Z' transform='translate(.000004 0.000002)' fill='#fff' stroke='#3f5787' stroke-width='0.564' /> </svg>";

    string internal constant RIGHT_FRAME =
        "<svg id='eBxUrEVnvhT1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' viewBox='0 0 282 282' shape-rendering='geometricPrecision' text-rendering='geometricPrecision' width='282' height='282'> <g transform='matrix(1 0 0-1 0.000001 229.751671)'> <path d='M3.043553,189.886992l14.000001,5.914859-.000001-94.504753-14-6.000001v94.589895Z' transform='translate(.000004 0.000002)' fill='#fff' stroke='#3f5787' stroke-width='0.564' /> <path d='M153.161826,40.693339l-14-6.743522L3.043553,95.297099l13.999999,6l136.118274-60.60376Z' transform='translate(.000002 0)' fill='#fff' stroke='#3f5787' stroke-width='0.564' />  <rect width='174.579991' height='66.410726' rx='0' ry='0' transform='matrix(.77969-.34714 0 1.415434 17.043553 101.297099)' fill='#fff' stroke='#000' stroke-linecap='round' /> <rect width='174.579991' height='66.410726' rx='0' ry='0' transform='matrix(.77969-.34714 0 1.415434 3.043553 95.297099)' fill='#fff' stroke='#000' stroke-linecap='round' /> <rect width='174.579991' height='66.410726' rx='0' ry='0' transform='matrix(.77969-.34714 0 1.415434 2.043553 95.297099)' fill='#fff' stroke='#000' stroke-linecap='round' /> <rect width='180.022193' height='63.114754' rx='0' ry='0' transform='matrix(.68-.302756 0 1.22 16.755739 104.955149)' fill='#e3e3e3' stroke='#000' stroke-linecap='round' />  </g>  </svg>";

    string internal constant RIGHT_CLOCK =
        "<svg id='exNZW9atlR71' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' viewBox='0 0 282 282' shape-rendering='geometricPrecision' text-rendering='geometricPrecision' width='282' height='282'><ellipse rx='62.715962' ry='62.715962' transform='matrix(.68 0 0.229382 0.92 60.587757 113.225884)' opacity='0.48' fill='#fff' stroke='#000'/><ellipse rx='62.715962' ry='62.715962' transform='matrix(.73194 0 0.242948 0.974413 60.587757 113.225884)' opacity='0.48' fill='#fff' stroke='#000'/><ellipse rx='62.715962' ry='62.715962' transform='matrix(.6 0 0.199462 0.8 56.587757 113.225884)' opacity='0.47' fill='#fff' stroke='#000'/><line x1='-13.104828' y1='-20.05841' x2='13.104828' y2='20.05841' transform='translate(38.604349 97.84777)' fill='none' stroke='#3f5787' stroke-width='2.82'/><line x1='-11.632239' y1='-2.9419' x2='11.632239' y2='2.9419' transform='translate(63.341416 120.84808)' fill='none' stroke='#3f5787' stroke-width='2.82'/></svg>";

    // closing svg tag
    string internal constant SVG_END = "</svg>";

    string internal constant G_START = "<g transform='translate(";
    string internal constant G_MID = ")'>";
    string internal constant G_END = "</g>";

    constructor() {
        objectToSVG["altar"] = ALTAR;
        objectToSVG["props"] = PROPS;
        objectToSVG["lFrame"] = LEFT_FRAME;
        objectToSVG["rFrame"] = RIGHT_FRAME;
        objectToSVG["rClock"] = RIGHT_CLOCK;
    }

    // getters for each string
    function getSvgStart() external pure returns (string memory) {
        return SVG_START;
    }

    function getSvgEnd() external pure returns (string memory) {
        return SVG_END;
    }

    function getGStart() external pure returns (string memory) {
        return G_START;
    }

    function getGMid() external pure returns (string memory) {
        return G_MID;
    }

    function getGEnd() external pure returns (string memory) {
        return G_END;
    }

    function getObjects(string memory object) external view returns (string memory) {
        return objectToSVG[object];
    }
}
