import React, { useEffect } from 'react';
import { useNavigate } from 'react-router-dom';

const Splashscreen = () => {
    const navigate = useNavigate();

    useEffect(() => {
        const timer = setTimeout(() => {
            navigate('/home');
        }, 5000);

        return () => clearTimeout(timer);
    }, [navigate]);

    return (
        <div className='min-h-screen bg-emerald-800 flex justify-center items-center'>
            <div class="three-body">
                <div class="three-body__dot"></div>
                <div class="three-body__dot"></div>
                <div class="three-body__dot"></div>
            </div>
        </div>
    )
};

export default Splashscreen;
