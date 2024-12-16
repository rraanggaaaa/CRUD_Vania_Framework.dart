import React from 'react';
import { Disclosure, DisclosureButton, DisclosurePanel } from '@headlessui/react';
import { Bars3Icon, XMarkIcon } from '@heroicons/react/24/outline';
import { Link } from 'react-router-dom'; // Impor Link

const Navbar = () => {

  const navigation = [
    { name: 'HOME', href: '#hero', current: false },
    { name: 'PORTFOLIO', href: '#portfolio', current: false },
    { name: 'CONTACT', href: '#contact', current: false },
  ];

  function classNames(...classes) {
    return classes.filter(Boolean).join(' ');
  }

  return (
    <header className="fixed inset-x-0 top-0 z-50">
      <Disclosure as="nav" className="bg-emerald-900 rounded-b-xl">
        <div className="mx-auto max-w-7xl px-2 sm:px-6 lg:px-8">
          <div className="relative flex h-20 items-center justify-between">
            <div className="absolute inset-y-0 left-0 flex items-center sm:hidden">
              {/* Mobile menu button*/}
              <DisclosureButton className="group relative inline-flex items-center justify-center rounded-md p-2 text-gray-400 hover:bg-yellow-400 hover:text-black focus:outline-none focus:ring-2 focus:ring-inset focus:ring-white">
                <span className="absolute -inset-0.5" />
                <span className="sr-only">Open main menu</span>
                <Bars3Icon aria-hidden="true" className="block h-6 w-6 group-data-[open]:hidden" />
                <XMarkIcon aria-hidden="true" className="hidden h-6 w-6 group-data-[open]:block" />
              </DisclosureButton>
            </div>
            <div className="flex flex-1 items-center justify-center sm:items-stretch sm:justify-start">
              <div className="flex flex-shrink-0 items-center">
                <img
                  alt="Your Company"
                  src="https://i.ibb.co.com/VwYSMmC/logo.png"
                  className="h-8 w-auto"
                />
              </div>
            </div>
            <div className="hidden sm:ml-6 sm:block">
              <div className="flex space-x-4">
                {navigation.map((item) => (
                  <a
                    key={item.name}
                    href={item.href}
                    aria-current={item.current ? 'page' : undefined}
                    className={classNames(
                      item.current ? 'bg-gray-900 text-white' : 'text-gray-300 hover:bg-yellow-400 hover:text-black',
                      'rounded-md px-3 py-2 text-sm font-medium',
                    )}
                  >
                    {item.name}
                  </a>
                ))}
                {/* Register and Login buttons */}
                <Link
                  to="/register" // Ganti href dengan to
                  className="text-white bg-blue-500 hover:bg-blue-700 hover:text-white rounded-md px-3 py-2 text-sm font-medium"
                >
                  REGISTER
                </Link>
                <Link
                  to="/login" // Ganti href dengan to
                  className="text-white bg-green-500 hover:bg-green-700 hover:text-white rounded-md px-3 py-2 text-sm font-medium"
                >
                  LOGIN
                </Link>
              </div>
            </div>
          </div>
        </div>

        <DisclosurePanel className="sm:hidden">
          <div className="space-y-1 px-2 pb-3 pt-2">
            {navigation.map((item) => (
              <DisclosureButton
                key={item.name}
                as="a"
                href={item.href}
                aria-current={item.current ? 'page' : undefined}
                className={classNames(
                  item.current ? 'bg-gray-900 text-white' : 'text-gray-300 hover:bg-yellow-400 hover:text-black',
                  'block rounded-md px-3 py-2 text-base font-medium',
                )}
              >
                {item.name}
              </DisclosureButton>
            ))}
            {/* Register and Login buttons for mobile view */}
            <DisclosureButton
              as={Link} // Ganti a dengan Link
              to="/register" // Ganti href dengan to
              className="block rounded-md px-3 py-2 text-base font-medium text-white bg-blue-500 hover:bg-blue-700 hover:text-white"
            >
              REGISTER
            </DisclosureButton>
            <DisclosureButton
              as={Link} // Ganti a dengan Link
              to="/login" // Ganti href dengan to
              className="block rounded-md px-3 py-2 text-base font-medium text-white bg-green-500 hover:bg-green-700 hover:text-white"
            >
              LOGIN
            </DisclosureButton>
          </div>
        </DisclosurePanel>
      </Disclosure>
    </header>
  );
};

export default Navbar;
