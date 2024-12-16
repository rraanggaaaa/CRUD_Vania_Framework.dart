import React, { useState, useEffect } from 'react';
import { Swiper, SwiperSlide } from 'swiper/react';
import 'swiper/css';
import 'swiper/css/autoplay';
import 'swiper/css/pagination';
import { Autoplay, Pagination } from 'swiper/modules';

const brands = [
  { id: 1, name: 'Brand 1', image: 'https://i.ibb.co.com/VwYSMmC/logo.png' },
  { id: 2, name: 'Brand 2', image: 'https://i.ibb.co.com/VwYSMmC/logo.png' },
  { id: 3, name: 'Brand 3', image: 'https://i.ibb.co.com/VwYSMmC/logo.png' },
  { id: 4, name: 'Brand 4', image: 'https://i.ibb.co.com/VwYSMmC/logo.png' },
  { id: 5, name: 'Brand 5', image: 'https://i.ibb.co.com/VwYSMmC/logo.png' },
  // Add more brands as needed
];

const targetAchievements = 150;
const targetServices = 20;

const Achievement = () => {
  const [achievements, setAchievements] = useState(0);
  const [services, setServices] = useState(0);

  useEffect(() => {
    const achievementInterval = setInterval(() => {
      setAchievements(prev => (prev < targetAchievements ? prev + 1 : prev));
    }, 10);

    const serviceInterval = setInterval(() => {
      setServices(prev => (prev < targetServices ? prev + 1 : prev));
    }, 100);

    if (achievements === targetAchievements) clearInterval(achievementInterval);
    if (services === targetServices) clearInterval(serviceInterval);

    return () => {
      clearInterval(achievementInterval);
      clearInterval(serviceInterval);
    };
  }, [achievements, services]);

  return (
    <div className="bg-emerald-800 rounded-b-3xl mx-auto py-16 px-4">
      <h2 className="text-3xl font-semibold text-center mb-8 text-white">Our Achievements</h2>
      
      {/* Brand Carousel */}
      <Swiper
        spaceBetween={50}
        slidesPerView={3}
        loop={true}
        autoplay={{ delay: 3000, disableOnInteraction: false }}
        pagination={{ clickable: true }}
        modules={[Autoplay, Pagination]}
        className="swiper-container"
      >
        {brands.map(brand => (
          <SwiperSlide key={brand.id}>
            <div className="flex items-center justify-center h-24 mb-10">
              <img
                src={brand.image}
                alt={brand.name}
                className="object-contain h-full"
              />
            </div>
          </SwiperSlide>
        ))}
      </Swiper>

      {/* Achievements and Services Section */}
      <div className="mt-16 text-center">
        <div className="flex justify-center space-x-8">
          <div>
            <h3 className="text-5xl font-bold text-yellow-500">
              {achievements}
            </h3>
            <p className="text-lg text-yellow-500">Total Achievements</p>
          </div>
          <div>
            <h3 className="text-5xl font-bold text-yellow-500">
              {services}
            </h3>
            <p className="text-lg text-yellow-500">Total Services</p>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Achievement;
