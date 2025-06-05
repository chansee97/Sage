#pragma once

#include "Core.h"

namespace Sage {
	class SAGE_API Application
	{
	public:
		void Run();
	};

	// To be defined in CLIENT
	Application* CreateApplication();
}

