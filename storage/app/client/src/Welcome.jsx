import React from 'react';
import Navbar from './components/Navbar';
import Services from './components/Services';
import Footer from './components/Footer';
import AboutUs from './components/AboutUs';
import Portfolio from './components/Portfolio';
import Achievement from './components/Achievement';

const Welcome = () => {
  return (
    <>
      <body>
        < Navbar />
        < Services />
        < AboutUs />
        < Achievement />
        < Portfolio />
        < Footer />
      </body>
    </>
  );
};

export default Welcome;
