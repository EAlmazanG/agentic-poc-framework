import { render, screen } from '@testing-library/react';

import HomePage from './page';

describe('HomePage', () => {
  it('renders the template title', () => {
    render(<HomePage />);

    expect(screen.getByText('Agentic POC Framework')).toBeInTheDocument();
    expect(screen.getByText('API foundation')).toBeInTheDocument();
  });
});
