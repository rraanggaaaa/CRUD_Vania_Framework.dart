import React, { useEffect, useState } from "react";
import axios from "axios";

const Home = () => {
    const [customers, setCustomers] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    useEffect(() => {
        // Fetch data from API
        axios
            .get("http://127.0.0.1:8080/api/customers")
            .then((response) => {
                // Ensure the response is an array
                const data = Array.isArray(response.data) ? response.data : [response.data];
                setCustomers(data);
                setLoading(false);
            })
            .catch((err) => {
                setError(err.message);
                setLoading(false);
            });
    }, []);

    if (loading) {
        return <div className="text-center text-blue-500 mt-10">Loading...</div>;
    }

    if (error) {
        return (
            <div className="text-center text-red-500 mt-10">
                Error: {error}
            </div>
        );
    }

    return (
        <div className="container mx-auto px-4 py-8">
            <h1 className="text-2xl font-bold text-center mb-6">
                Customer List
            </h1>
            {customers.length > 0 ? (
                <table className="min-w-full bg-white border border-gray-300 rounded-lg overflow-hidden shadow">
                    <thead className="bg-gray-200">
                        <tr>
                            <th className="py-2 px-4 text-left text-sm font-medium text-gray-700">ID</th>
                            <th className="py-2 px-4 text-left text-sm font-medium text-gray-700">Name</th>
                            <th className="py-2 px-4 text-left text-sm font-medium text-gray-700">Address</th>
                            <th className="py-2 px-4 text-left text-sm font-medium text-gray-700">City</th>
                            <th className="py-2 px-4 text-left text-sm font-medium text-gray-700">State</th>
                            <th className="py-2 px-4 text-left text-sm font-medium text-gray-700">Zip</th>
                            <th className="py-2 px-4 text-left text-sm font-medium text-gray-700">Country</th>
                            <th className="py-2 px-4 text-left text-sm font-medium text-gray-700">Phone</th>
                        </tr>
                    </thead>
                    <tbody>
                        {customers.map((customer, index) => (
                            <tr
                                key={customer.cust_id}
                                className={`border-t ${index % 2 === 0 ? "bg-gray-50" : "bg-white"}`}
                            >
                                <td className="py-2 px-4 text-sm text-gray-800">{customer.cust_id}</td>
                                <td className="py-2 px-4 text-sm text-gray-800">{customer.cust_name}</td>
                                <td className="py-2 px-4 text-sm text-gray-800">{customer.cust_address}</td>
                                <td className="py-2 px-4 text-sm text-gray-800">{customer.cust_city}</td>
                                <td className="py-2 px-4 text-sm text-gray-800">{customer.cust_state}</td>
                                <td className="py-2 px-4 text-sm text-gray-800">{customer.cust_zip}</td>
                                <td className="py-2 px-4 text-sm text-gray-800">{customer.cust_country}</td>
                                <td className="py-2 px-4 text-sm text-gray-800">{customer.cust_telp}</td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            ) : (
                <div className="text-center text-gray-500 mt-10">
                    No customers found.
                </div>
            )}
        </div>
    );
};

export default Home;
