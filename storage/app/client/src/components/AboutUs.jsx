import React from 'react';

const AboutUs = () => {
    return (
        <div 
            id='aboutUs' 
            className="min-h-screen flex items-center justify-center bg-cover bg-center bg-emerald-800"
            style={{ 
                backgroundImage: "url('https://i.postimg.cc/LsyZcBfJ/vecteezy-wireframe-linear-tech-decorative-background-in-futuristic-7546180.jpg')", 
                backgroundBlendMode: "multiply"
            }}
        >
            <div className="container mx-auto px-10 py-10 bg-emerald-800 bg-opacity-80">
                <div className="grid grid-cols-1 md:grid-cols-2 gap-8 items-center">
                    <div className="text-white">
                        <h2 className="text-xl lg:text-3xl font-semibold mb-4">
                            ABOUT <span className="text-yellow-500">US</span>
                        </h2>
                        <p className="mb-6">
                            Our team of expert developers and designers work collaboratively to bring your vision to life,
                            crafting websites that are as functional as they are visually stunning, ensuring your online
                            presence stands out in a crowded market.
                        </p>
                    </div>
                    <div 
                        className="bg-gray-300 h-96 bg-cover bg-center" 
                        style={{ backgroundImage: "url('https://i.postimg.cc/LsyZcBfJ/vecteezy-wireframe-linear-tech-decorative-background-in-futuristic-7546180.jpg')" }}
                    ></div>
                    <div className="flex space-x-5 md:col-span-2">
                        {['PHP', 'Py', 'Re', 'JS', 'CSS'].map((tech, index) => (
                            <div
                                key={index}
                                className="bg-yellow-500 h-16 w-16 flex items-center justify-center rounded transform transition-transform duration-300 hover:scale-125"
                            >
                                <span className="font-bold text-black">{tech}</span>
                            </div>
                        ))}
                    </div>
                </div>
            </div>
        </div>
    );
};

export default AboutUs;
