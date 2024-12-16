import React from 'react';

const Services = () => {
  return (
    <div id='services' className='min-h-screen mt-20 grid justify-center items-center bg-slate-300'>
      <div className='flex justify-center items-center text-xl lg:text-3xl font-semibold'>
        <p className='text-yellow-500 mt-5 js-slide-in-from-top'>IT <span className='text-black'>SERVICES</span></p>
      </div>

      <div className='flex -mt-2 justify-center text-center items-center text-sm lg:text-xl font-regular'>
        <div className='px-16 lg:px-72 leading-4 lg:leading-6'>
          <p className='text-black mt-5 js-slide-in-from-top'>Lorem ipsum dolor sit amet consectetur adipisicing elit. Qui eum eos placeat dignissimos nihil quos molestias consectetur architecto deserunt ex.</p>
        </div>
      </div>

      <div className="py-2 flex text-center md:text-left">
        <div className="grid gap-8 md:grid-cols-2 lg:grid-cols-3 my-4">
          <div className="flex flex-col bg-slate-200 h-auto w-auto mx-6 p-6 rounded-lg items-center justify-center">
            <img className='h-20 w-auto' src="https://i.ibb.co/7vQvz6r/web-dev.png" alt="web-dev" border="0" />
            <div className='mx-10 flex-col justify-center items-center'>
              <p className='text-lg py-4 font-medium flex justify-center items-center js-slide-in-from-left'>
                Website Development
              </p>
              <p className='text-md line-clamp-2 font-normal text-justify leading-5 js-slide-in-from-right'>
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Earum minus explicabo error numquam similique hic illo, cupiditate iure adipisci voluptas.
              </p>
            </div>
            <button className='bg-yellow-500 m-4 px-8 py-2 text-white rounded-lg'>
              More
            </button>
          </div>

          <div className="flex flex-col bg-slate-200 h-auto w-auto mx-6 p-6 rounded-lg items-center justify-center">
            <img className='h-20 w-auto' src="https://i.ibb.co/tqhrK0R/mobile-dev.png" alt="mobile-dev" border="0" />
            <div className='mx-10 flex-col justify-center items-center'>
              <p className='text-lg py-4 font-medium flex justify-center items-center js-slide-in-from-left'>
                Mobile Development
              </p>
              <p className='text-md line-clamp-2 font-normal text-justify leading-5 js-slide-in-from-right'>
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Earum minus explicabo error numquam similique hic illo, cupiditate iure adipisci voluptas.
              </p>
            </div>
            <button className='bg-yellow-500 m-4 px-8 py-2 text-white rounded-lg'>
              More
            </button>
          </div>

          <div className="flex flex-col bg-slate-200 h-auto w-auto mx-6 p-6 rounded-lg items-center justify-center">
            <img className='h-20 w-auto' src="https://i.ibb.co/4f5QDp1/ai-dev.png" alt="ai-dev" border="0" />
            <div className='mx-10 flex-col justify-center items-center'>
              <p className='text-lg overflow-hidden py-4 font-medium flex justify-center items-center js-slide-in-from-left'>
                AI Development
              </p>
              <p className='text-md line-clamp-2 font-normal text-justify leading-5 js-slide-in-from-right'>
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
  );
};

export default Services;
