import React from 'react';

const Portfolio = () => {
    return (
        <div id='portfolio' className='grid justify-center items-center bg-emerald-800'>
            <div>
                <p className='text-yellow-500 text-xl font-medium flex justify-center items-center my-4 -mb-2'>
                    Check our Website Portfolio
                </p>
                <div className="py-2 flex text-center md:text-left">
                    <div className="grid gap-8 md:grid-cols-2 lg:grid-cols-2 my-4">

                        <div className="sm:flex bg-slate-200 h-auto w-auto mx-6 rounded-lg items-center justify-center">
                            <div className='flex h-40 w-full justify-center items-center'>
                                <img className='h-full w-full' src="https://i.ibb.co/7vQvz6r/web-dev.png" alt="web-dev" border="0" />
                            </div>
                            <div className='bg-white rounded-lg'>
                                <div className='mx-10 flex flex-col justify-center items-center'>
                                    <p className='text-lg py-4 font-medium flex justify-center items-center js-slide-in-from-left'>
                                        Website Development
                                    </p>
                                    <p className='text-md line-clamp-2 font-normal text-justify leading-5 js-slide-in-from-top'>
                                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Earum minus explicabo error numquam similique hic illo, cupiditate iure adipisci voluptas.
                                    </p>
                                </div>
                                <button className='bg-yellow-500 m-4 px-8 py-2 text-white rounded-lg'>
                                    More
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div className='grid justify-center items-center bg-white'>
            <div>
                <p className='text-yellow-500 text-xl font-medium flex justify-center items-center my-4 -mb-2'>
                    Check our Mobile Portfolio
                </p>
                <div className="py-2 flex text-center md:text-left">
                    <div className="grid gap-8 md:grid-cols-2 lg:grid-cols-2 my-4">
                        <div className="sm:flex bg-slate-200 h-auto w-auto mx-6 rounded-lg items-center justify-center">
                            <div className='flex h-40 w-full justify-center items-center'>
                                <img className='h-full w-full' src="https://i.ibb.co/7vQvz6r/web-dev.png" alt="web-dev" border="0" />
                            </div>
                            <div className='bg-emerald-800 text-white rounded-lg'>
                                <div className='mx-10 flex flex-col justify-center items-center'>
                                    <p className='text-lg py-4 font-medium flex justify-center items-center js-slide-in-from-left'>
                                        Website Development
                                    </p>
                                    <p className='text-md line-clamp-2 font-normal text-justify leading-5 js-slide-in-from-top'>
                                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Earum minus explicabo error numquam similique hic illo, cupiditate iure adipisci voluptas.
                                    </p>
                                </div>
                                <button className='bg-yellow-500 m-4 px-8 py-2 text-white rounded-lg'>
                                    More
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>

    );
};

export default Portfolio;
